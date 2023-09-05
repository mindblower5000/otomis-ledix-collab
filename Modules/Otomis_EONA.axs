MODULE_NAME='Otomis_Eona' (DEV vdvEona, DEV dvEona, DEV TPs[], INTEGER chCodes[], CHAR IP[15], CHAR TerminalsIP[][15], CHAR TerminalsPower[], CHAR TerminalsActivity[][15], CHAR TerminalsChannel[], INTEGER start_delay)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 09/28/2022  AT: 14:30:24        *)
(***********************************************************)

/*
	EONA (Teveo SWI Pack / REST API)
	---------------------------------
	Author : 		JA
	Version : 		1.0
	---------------------------------
	
GET		/api /v1 /terminals /{address} /state		Get information about the current state/activity of a terminal	(PAGE-7)
{
	"power":"on",
	"volume":12,
	"mute":true,
	"activity":
	{
		"service":"tv",
		"item":1
	}
}

PUT		/api /v1 /terminals /{address} /state /activity		Change the activity of the terminal	(PAGE-7)
{
	"activity":
	{
		"service":"tv",
		"item":1
	}
}

PUT		/api /v1 /terminals /{address} /state /key			Simulate a press on an RCU key	(PAGE-8)
{
	"key":"arrowUp"
}

PUT		/api /v1 /terminals /{address} /state /power		Change the power state of a terminal (PAGE-10)
{
	"power":"on"
}
	
*/

#INCLUDE 'UnicodeLib.axi'
#INCLUDE '_utils'
#INCLUDE '_utils2'
#INCLUDE 'math'
#INCLUDE 'http'
#INCLUDE 'jsmn-util'

DEFINE_CONSTANT

//Main loop
TIMELINE_ID_LOOP   = 7000
CONSTANT LONG   KEEP_ALIVE_TIMES[1]		= {120000} 

//Communication
PORT_UDP_FEEDBACK = 41110
HTTP_TIMEOUT = 30


//*****************************************************************************

//Queue system
QUEUE_SEPARATOR = $03


DEFINE_VARIABLE

//AMX sockets base port number
INTEGER HTTP_BASE_PORT

//Queue buffer and communication variables
VOLATILE CHAR _commandQueue[500]
VOLATILE CHAR _queueCom[500]
VOLATILE CHAR httpReceiveBuffer[16384]
VOLATILE CHAR UDPreceiveBuffer[10000]
VOLATILE CHAR requestGET_ID
VOLATILE CHAR sendingInProgress			= FALSE

DEFINE_FUNCTION debug(INTEGER logLevel, CHAR message[])
{
	AMX_LOG(logLevel, "'Otomis_Eona (', ITOA(dvEona.PORT), ') - ', LEFT_STRING(message, 220)")
	SEND_STRING 0, "'Otomis_Eona (', ITOA(dvEona.PORT), ') - ', LEFT_STRING(message, 220)"
}
DEFINE_FUNCTION CHAR find_terminal_id(CHAR ip[])
{
	stack_var char i
	
	SEND_STRING 0, "'IP find_terminal_id : ', ip"
	
	for(i=1;i<=LENGTH_ARRAY(TerminalsIP);i++)
	{
		if(ip == TerminalsIP[i])
			return i
	}
	return 0
}
DEFINE_FUNCTION SendPutCommand(CHAR devIP[15], CHAR opt[60], CHAR _body[1000])
{
	local_var char formattedUrl[100]
	local_var http_header headers[5]

	if (length_string(opt) == 0)
		opt = ''

	timed_wait_until(sendingInProgress == FALSE) 40
	{
		if (devIP <> '' && length_string(devIP) >= 7)
		{
			sendingInProgress = TRUE
			formattedUrl = "'http://', IP, '/api/v1/terminals/',devIP,'/',opt"		
			http_put(formattedUrl, _body, headers)
			requestGET_ID = find_terminal_id(devIP)
			debug(amx_debug, "'Eona (', IP,') PUT Request Sent : ',formattedUrl,' - ',_body")
			wait 5 sendingInProgress = FALSE
		}
	}
}
DEFINE_FUNCTION SendGetCommand(CHAR _data[1000])
{
	local_var char formattedUrl[100]
	local_var char IP_Terminal[15]
	STACK_VAR http_header headers[5]
   
	CANCEL_WAIT 'http_timeout'
	sendingInProgress = TRUE
	WAIT HTTP_TIMEOUT 'http_timeout'
	{
		sendingInProgress = FALSE
		processNextItemInQueue()
	}
	
	formattedUrl = "'http://', IP, _data"		// http://XXX.XXX.XXX.XXX/api/v1/terminals/10.1.2.110/state

	remove_string(_data, 'terminals/',1) 		// 10.1.2.110/state
	
	IP_Terminal = remove_string(_data, '/',1) 	// 10.1.2.110/
	IP_Terminal = LEFT_STRING(IP_Terminal, LENGTH_STRING(IP_Terminal) - 1) // 10.1.2.110

	http_get(formattedUrl, headers)
	
	requestGET_ID = find_terminal_id(IP_Terminal)

	debug(AMX_INFO, "'Eona (', IP,') GET Request sent : ', formattedUrl")
}


DEFINE_FUNCTION FormatSendCommand (CHAR CMD[1500])
//Send directly the command after its formatting
{	
	SendGetCommand("'/api/v1/terminals/', CMD")
}

DEFINE_FUNCTION processNextItemInQueue()
{
	IF(FIND_STRING(_commandQueue, "QUEUE_SEPARATOR", 1) != 0)	//the queue is not empty 
	{
		_queueCom = REMOVE_STRING(_commandQueue, "QUEUE_SEPARATOR", 1) //Splits the first queue entry		
		_queueCom = LEFT_STRING (_queueCom, LENGTH_STRING(_queueCom) - 1) //Removes the queue separator
		
		FormatSendCommand(_queueCom);
	}
}

DEFINE_FUNCTION AddCommandToQueue (CHAR CMD[])
//Add the command to the queue buffer in order to be sent
{	
	IF(! sendingInProgress)
		FormatSendCommand(CMD)
	ELSE
		_commandQueue = "_commandQueue, CMD, QUEUE_SEPARATOR"
}

DEFINE_FUNCTION http_error(LONG seqNumber, CHAR reqHost[512], http_request req, LONG errorCode)
{
	debug(AMX_WARNING, "'http_error::', ITOA(errorCode)")
	sendingInProgress = FALSE
	
	processNextItemInQueue()
}

DEFINE_FUNCTION http_response_received(LONG seqNumber, CHAR reqHost[512], http_request req, http_response rep)
{
	STACK_VAR INTEGER 		i
	STACK_VAR INTEGER 		JSON_POSITION
	STACK_VAR INTEGER 		key_val_count
	STACK_VAR INTEGER 		category
	STACK_VAR jsmn_parser 	parser
	STACK_VAR jsmn_token 	tokens[300]
	
	httpReceiveBuffer = rep.body
	//httpReceiveBuffer = '{"power":"on","volume":12,"mute":true,"activity":{"service":"wiredSources","item":2}}'

	debug(AMX_DEBUG, "'Received on HTTP : ', ITOA(seqnumber), ' ', httpReceiveBuffer")
	
	JSON_POSITION = FIND_STRING(httpReceiveBuffer, '{', 1)
	
	// JA
	IF(JSON_POSITION)
	{
	    REMOVE_STRING(httpReceiveBuffer,'{', 1)
	    httpReceiveBuffer = "'{',httpReceiveBuffer"
	    
	    debug(AMX_DEBUG, "'JSON Received on HTTP : ', httpReceiveBuffer")
	}
	// JA
	
	IF (JSON_POSITION == 0)
	{	
	    debug (AMX_DEBUG, 'http_response_received::NO JSON ANSWER RECEIVED.')
		sendingInProgress = FALSE
		
	    RETURN
	}	
	
	jsmn_init(parser)
	key_val_count = jsmn_parse(parser, httpReceiveBuffer, tokens)
	
	IF (key_val_count > 300)
	{
		debug(AMX_WARNING, 'http_response_received::out of range for parser')
		sendingInProgress = FALSE
		
		RETURN
	}
	
	debug (AMX_DEBUG, "'http_response_received::JSON MAP KEYS COUNT :', ITOA(key_val_count)")
		
	//At first token, we find all the JSON string, so we ignore
	FOR(i = 2; i <= key_val_count ; i++) 
	{
	    debug (AMX_DEBUG, "'http_response_received::type:', ITOA(tokens[i].type), ' VAL:', json_get_token(httpReceiveBuffer, tokens[i])");
	    
	    IF (tokens[i].type == JSMN_STRING)
		{

			SWITCH(json_get_token(httpReceiveBuffer, tokens[i]))
			{
				CASE 'power':
				{
					
					IF(json_get_token(httpReceiveBuffer, tokens[i+1]) == 'on') 
						TerminalsPower[requestGET_ID] = TRUE
					ELSE IF(json_get_token(httpReceiveBuffer, tokens[i+1]) == 'standby') 
						TerminalsPower[requestGET_ID] = FALSE
					
					i++
				}
				
				CASE 'activity':
				{
					
					IF(json_get_token(httpReceiveBuffer, tokens[i+2]) == 'service')
					{
						IF(json_get_token(httpReceiveBuffer, tokens[i+3]) == 'tv') 
						{
							TerminalsActivity[requestGET_ID] = 'TV'
							TerminalsPower[requestGET_ID] = TRUE
						}
						ELSE IF(json_get_token(httpReceiveBuffer, tokens[i+3]) == 'wiredSources') 
						{
							TerminalsActivity[requestGET_ID] = 'SRC'
							TerminalsPower[requestGET_ID] = TRUE
						}
						
						IF(json_get_token(httpReceiveBuffer, tokens[i+4]) == 'item')
						{
							IF(TerminalsActivity[requestGET_ID] == 'TV')
							    TerminalsChannel[requestGET_ID] = atoi(json_get_token(httpReceiveBuffer, tokens[i+5]))
							ELSE IF(TerminalsActivity[requestGET_ID] == 'SRC')
							    TerminalsActivity[requestGET_ID] = json_get_token(httpReceiveBuffer, tokens[i+5])
							
							i = i + 5
						}
						ELSE
						{
							i = i + 3
						}							
					}
				}
			}
	    }
	}
	
	sendingInProgress = FALSE
	processNextItemInQueue()
}

DEFINE_FUNCTION pollAllZones()
{
//	TODO ????	
}

DEFINE_START
{
	stack_var integer x
	
	HTTP_BASE_PORT = dvEona.PORT


	//HTTP INCLUDE DEFINE_START
	http_socket.number = 0
	http_socket.port = HTTP_BASE_PORT
	http_socket.system = system_number
	create_buffer http_socket, http_socket_buff

	REBUILD_EVENT()
}

DEFINE_EVENT

DATA_EVENT[vdvEona]
{
	ONLINE:
	{		
		WAIT start_delay + 30
		{
			WAIT 20 
			{
				pollAllZones()
				TIMELINE_CREATE(TIMELINE_ID_LOOP, KEEP_ALIVE_TIMES, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)		
			}
		}
	}

	COMMAND:
	{
		LOCAL_VAR CHAR cmd[200]
		LOCAL_VAR CHAR tab[5][32]
		
		cmd = UPPER_STRING(DATA.TEXT)
		
		tab[1] = ''
		tab[2] = ''
		tab[3] = ''
		tab[4] = ''
		tab[5] = ''
		
		StringSplit(cmd, ':', tab)
		
		SWITCH (tab[1])
		{			
			CASE 'STATUS': // 'STATUS:3:?
			{
				
				SWITCH (tab[3])
				{		
					CASE '?':	
					{
						AddCommandToQueue("TerminalsIP[atoi(tab[2])],'/state'")
					}
				}
			}
			
			CASE 'POWER': // 'POWER:3:OFF
			{
				
				SWITCH (tab[3])
				{		
					CASE 'ON':
					{						
						SendPutCommand(TerminalsIP[atoi(tab[2])], "'state/power'","'{"power":"on"}'")
					}
					CASE 'OFF':
					{						
						/*SendGetCommand("'/api/v1/','digital_signage/4/run'")
						wait 50*/
						SendPutCommand(TerminalsIP[atoi(tab[2])], "'state/power'","'{"power":"standby"}'")
					}
				}
			}
			CASE 'ACTIVITY': // 'ACTIVITY:3:TV
			{
				
				SWITCH (tab[3])
				{		
					CASE 'TV':		// TV (Chanel#1)
					{						
						SEND_COMMAND vdvEona, "'PRESET:',tab[2],':1'"
						//SendPutCommand(TerminalsIP[atoi(tab[2])], "'state/activity'","'{"activity": {"service":"tv","item":1}}'")
					}
					CASE 'CHROMECAST':	// HDMI-1
					{						
						SendPutCommand(TerminalsIP[atoi(tab[2])], "'state/activity'","'{"activity": {"service":"wiredSources","item":"CHROMECAST"}}'")
					}
					CASE 'AIRPLAY':	// HDMI-2
					{						
						SendPutCommand(TerminalsIP[atoi(tab[2])], "'state/activity'","'{"activity": {"service":"wiredSources","item":"AIRPLAY"}}'")
					}
					CASE 'VOD':		// VOD
					{						
						SendPutCommand(TerminalsIP[atoi(tab[2])], "'state/activity'","'{"activity": {"service":"vod"}}'")
					}
					CASE 'ART':		// ART
					{						
						SendGetCommand("'/api/v1/','digital_signage/',tab[4],'/run'")
					}
				}
			}

			CASE 'PRESET': // PRESET:3:22
			{				
				SendPutCommand(TerminalsIP[atoi(tab[2])], "'state/activity'","'{"activity": {"service":"tv","item":',tab[3],'}}'")
				OFF[TPs[atoi(tab[2])],chCodes]
				ON[TPs[atoi(tab[2])],chCodes[atoi(tab[3]) + 40]]
			}
			
			CASE 'REMOTE': // REMOTE:3:UP
			{
				stack_var char key[20]
				
				SWITCH(tab[3])
				{					
					CASE 'POWER':		key = 'power'
					CASE 'NUM_0':		key = 'digit0'
					CASE 'NUM_1':		key = 'digit1'
					CASE 'NUM_2':		key = 'digit2'
					CASE 'NUM_3':		key = 'digit3'
					CASE 'NUM_4':		key = 'digit4'
					CASE 'NUM_5':		key = 'digit5'
					CASE 'NUM_6':		key = 'digit6'
					CASE 'NUM_7':		key = 'digit7'
					CASE 'NUM_8':		key = 'digit8'
					CASE 'NUM_9':		key = 'digit9'
					CASE 'TV':			key = 'tv'
					CASE 'AV':			key = 'av'
					CASE 'UP':			key = 'arrowUp'
					CASE 'DOWN':		key = 'arrowDown'
					CASE 'LEFT':		key = 'arrowLeft'					
					CASE 'RIGHT':		key = 'arrowRight'
					CASE 'OK':			key = 'ok'
					CASE 'BACK':		key = 'back'
					CASE 'HOME':		key = 'home'
					CASE 'V+': 			key = 'volumeUp'
					CASE 'V-': 			key = 'volumeDown'
					CASE 'MUTE': 		key = 'volumeMute'
					CASE 'PLAYPAUSE': 	key = 'playerPlayPause'
					CASE 'PAUSE': 		key = 'playerPause'
					CASE 'STOP': 		key = 'playerStop'
					CASE 'REWIND': 		key = 'playerRewind'
					CASE 'FORWARD': 	key = 'playerFastForward'
					CASE 'CH+': 		key = 'channelUp'
					CASE 'CH-': 		key = 'channelDown'
				}
					SendPutCommand(TerminalsIP[atoi(tab[2])], "'state/key'","'{"key":"',key,'"}'")
			}
		}
	}
}
BUTTON_EVENT[TPs, chCodes]
{
	PUSH:
	{
		STACK_VAR _tp, _button
		
		_tp = GET_LAST(TPs)
		_button = GET_LAST(chCodes)

		SELECT
		{
			//TNT Presets
			ACTIVE (_button > 40):
				SEND_COMMAND vdvEona, "'PRESET:', itoa(_tp),':', ITOA(_button - 40)"
			
			//Remote control
			ACTIVE (_button == 1): 		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':POWER'"
			ACTIVE (_button == 2): 		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_0'"
			ACTIVE (_button == 3): 		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_1'"
			ACTIVE (_button == 4): 		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_2'"
			ACTIVE (_button == 5): 		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_3'"
			ACTIVE (_button == 6):		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_4'"
			ACTIVE (_button == 7): 		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_5'"
			ACTIVE (_button == 8): 		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_6'"
			ACTIVE (_button == 9): 		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_7'"
			ACTIVE (_button == 10): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_8'"
			ACTIVE (_button == 11): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':NUM_9'"
			ACTIVE (_button == 12): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':TV'"
			ACTIVE (_button == 13): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':AV'"	
			ACTIVE (_button == 14): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':UP'"
			ACTIVE (_button == 15):		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':DOWN'"	
			ACTIVE (_button == 16): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':LEFT'"	
			ACTIVE (_button == 17):		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':RIGHT'"	
			ACTIVE (_button == 18):		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':OK'"	
			ACTIVE (_button == 19):		SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':BACK'"
			ACTIVE (_button == 20): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':HOME'"
			ACTIVE (_button == 21): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':V+'"	
			ACTIVE (_button == 22): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':V-'"	
			ACTIVE (_button == 23): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':MUTE'"
			ACTIVE (_button == 24): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':PLAYPAUSE'"
			ACTIVE (_button == 25): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':PAUSE'"	
			ACTIVE (_button == 26): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':STOP'"
			ACTIVE (_button == 27): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':REWIND'"	
			ACTIVE (_button == 28): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':FORWARD'"
			ACTIVE (_button == 29): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':CH+'"
			ACTIVE (_button == 30): 	SEND_COMMAND vdvEona, "'REMOTE:', itoa(_tp),':CH-'"
		}			           
	}
}

TIMELINE_EVENT[TIMELINE_ID_LOOP]
{
	pollAllZones()
}