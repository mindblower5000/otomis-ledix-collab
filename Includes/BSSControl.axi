PROGRAM_NAME='BSSControl'

DEFINE_CONSTANT

//-----------------------------------------------------------------------------
// Generic protocol variables -------------------------------------------------
//-----------------------------------------------------------------------------
//Commmand types
CHAR BSS_SET 					= $88;
CHAR BSS_SUBSCRIBE 				= $89;
CHAR BSS_UNSUBSCRIBE 			= $8A;
CHAR BSS_RECALL_PARAM_PRESET 	= $8C;
CHAR BSS_SET_PERCENT		 	= $8D;
CHAR BSS_SUBSCRIBE_PERCENT	 	= $8E;
CHAR BSS_UNSUBSCRIBE_PERCENT 	= $8F;
CHAR BSS_BUMP_PERCENT 			= $90;
CHAR BSS_SET_STRING 			= $91;

//Addressing
//Virtual device
CHAR BSS_AUDIO					= $03;
CHAR BSS_LOGIC					= $02;


//Queue system
CHAR BSS_QUEUE_SEPARATOR 		= $03;	 //Because it is reserved and cannot be found in a message
LONG BSS_STRING_SEND_TIME[1] 	= {80}; //Wait time between string sendings

//-----------------------------------------------------------------------------
// Project specific variables -------------------------------------------------
//-----------------------------------------------------------------------------
CHAR DSP_ADDR_FIRST_BYTE			= $00;
CHAR DSP_ADDR_SEC_BYTE				= $01;

SLONG VOLUME_BUMP_UP				= 1;
SLONG VOLUME_BUMP_DOWN				= -1;

BSS_CLIENT_PORT						= 1023

DEFINE_VARIABLE

//Queue buffer and next string to send
VOLATILE CHAR bssCommandQueue[2000];
VOLATILE CHAR lastBSSCommandSent[60];
VOLATILE CHAR bssReceiveBuffer[2000];

VOLATILE CHAR bssGainAddresses[NB_AUDIO_ZONES][8] = {

	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$00}, 	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$01},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$02}, 	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$03},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$04},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$05},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$06},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$07},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$08},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$09},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$0A},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$0B},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$0C},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$0D},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$0E},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$0F},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$10},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$11}, 	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$12}, 	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$13}//, 	//
//	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00,	$14} 	//
};

VOLATILE CHAR bssMuteAddresses[NB_AUDIO_ZONES][8] = {

	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $20}, 	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $21},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $22}, 	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $23},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $24},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $25},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $26},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $27},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $28},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $29},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $2A},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $2B},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $2C},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $2D},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $2E},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $2F},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $30},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $31}, 	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $32},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $33}//,	//
//	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $03,   $00, $34} 	//
};

VOLATILE CHAR bssSourceAddresses[NB_AUDIO_ZONES][8] = {

	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $00}, 	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $01},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $02}, 	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $03},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $04},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $05},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $06},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $07},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $08},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $09},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $0A},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $0B},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $0C},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $0D},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $0E},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $0F},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $10},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $11},  	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $12},	//
	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $13}//,	//
//	{DSP_ADDR_FIRST_BYTE, DSP_ADDR_SEC_BYTE, BSS_AUDIO,   $00, $01, $02,   $00, $14}   	//
};

VOLATILE FLOAT   zoneVolume[NB_AUDIO_ZONES];
VOLATILE INTEGER zoneMute  [NB_AUDIO_ZONES];
VOLATILE INTEGER zoneSource[NB_AUDIO_ZONES];
VOLATILE CHAR audioLevelPushed[NB_AUDIO_ZONES];

define_function char[4] longToBytes(LONG val)
{
	STACK_VAR CHAR result[4];
	
	result = "type_cast((val & $FF000000) >> 24)";
	result = "result, type_cast((val & $FF0000) >> 16)";
	result = "result, type_cast((val & $FF00) >> 8)";
	result = "result, type_cast((val & $FF))";
	
	return result;
}

DEFINE_FUNCTION LONG bytesToLong(CHAR val[4]) //TAKES A CHAR[4] ARRAY AND RETURNS A LONG
{
	RETURN (val[1] * 2^24) + (val[2] * 65536) + (val[3] * 256) + val[4];
}

DEFINE_FUNCTION fnLOG_HEX(CHAR cDATA[], INTEGER LENGTH, CHAR cMESSAGE[]) // USED FOR HEX LOGGING TO TELNET
{
    STACK_VAR INTEGER INDEX
    STACK_VAR CHAR HEX_DATA[5000] // MAX SIZE  
    
	FOR(INDEX=1;INDEX<=LENGTH;INDEX++)
		HEX_DATA="HEX_DATA,FORMAT(' $%02X',cDATA[INDEX])"
	
    WHILE(LENGTH_STRING(HEX_DATA))
	{
		AMX_LOG(AMX_DEBUG,"cMESSAGE,GET_BUFFER_STRING(HEX_DATA,80)")
	}
}

DEFINE_FUNCTION addCommandToBSSQueue (CHAR _data[])
//Add the command to the queue buffer in order to be sent
{
	bssCommandQueue = "bssCommandQueue, _data";
}

define_function bssSendCommand(DEV dvDSP, CHAR bssCommand, CHAR address[8], CHAR value[4])
{
	LOCAL_VAR CHAR body[30];
	LOCAL_VAR CHAR bodyAfterSubstitution[60];
	LOCAL_VAR CHAR checksum;
	LOCAL_VAR INTEGER i;
	
	//Variable initialization
	checksum = $00;
	bodyAfterSubstitution = "";
	
	//Create the body
	body = "bssCommand, address, value";
	
	//Compute checksum
	FOR(i=1 ; i<=LENGTH_STRING(body) ; i++)
	{
		checksum = checksum BXOR body[i];
	}
	
	body = "body, checksum";
	
	//Byte substitution for special characters ($02, $03, $06, $15, $1B)
	FOR(i=1 ; i<=LENGTH_STRING(body) ; i++)
	{
		SWITCH (body[i])
		{
			CASE $02: 	CASE $03: 	CASE $06: 	CASE $15: 	CASE $1B:
			{
				bodyAfterSubstitution = "bodyAfterSubstitution, $1B, $80 + body[i]";
			}
			
			DEFAULT:
			{
				bodyAfterSubstitution = "bodyAfterSubstitution, body[i]";
			}
		}
	}
	
	//Compose and send the message
	lastBSSCommandSent = "$02, bodyAfterSubstitution, $03";
	addCommandToBSSQueue(lastBSSCommandSent);
}

define_function bssBumpVolume(DEV dvDSP, CHAR address[8], SLONG value)
{
	STACK_VAR LONG val;
	val = type_cast(65536 * value);
	
	#DISABLE_WARNING 10571
	bssSendCommand(dvDSP, BSS_BUMP_PERCENT, address, longToBytes(val))
}
define_function bssSetValue(DEV dvDSP, CHAR address[8], INTEGER value)
{
	bssSendCommand(dvDSP, BSS_SET, address, longToBytes(value))
}
define_function bssSetPercent(DEV dvDSP, CHAR address[8], INTEGER value)
{
	STACK_VAR LONG val;
	val = type_cast(65536 * value);
	
	bssSendCommand(dvDSP, BSS_SET_PERCENT, address, longToBytes(val))
}
define_function bssSubscribe(DEV dvDSP, CHAR address[8])
{
	bssSendCommand(dvDSP, BSS_SUBSCRIBE, address, longToBytes(0))
}
define_function bssSubscribePercent(DEV dvDSP, CHAR address[8])
{
	bssSendCommand(dvDSP, BSS_SUBSCRIBE_PERCENT, address, longToBytes(0))
}
define_function bssUnsubscribe(DEV dvDSP, CHAR address[8])
{
	bssSendCommand(dvDSP, BSS_UNSUBSCRIBE, address, "")
}
define_function bssUnsubscribePercent(DEV dvDSP, CHAR address[8])
{
	bssSendCommand(dvDSP, BSS_UNSUBSCRIBE_PERCENT, address, "")
}

define_function bssInitSubscriptions(DEV dvDSP)
{
	STACK_VAR INTEGER i;
	
	FOR (i=1 ; i<=NB_AUDIO_ZONES ; i++)
	{
		bssSubscribePercent	(dvDSP, bssGainAddresses[i]);
		bssSubscribe		(dvDSP, bssMuteAddresses[i]);
		bssSubscribe		(dvDSP, bssSourceAddresses[i]);
	}
}

define_function bssFeedbackAnalysis (CHAR event, CHAR address[8], CHAR value[4])
{
	STACK_VAR INTEGER i;
	
	AMX_LOG (AMX_DEBUG, "'EV : ', FORMAT('$%02X ', event), 
			' - ADD : ', 
			FORMAT('$%02X ', address[1]), FORMAT('$%02X ', address[2]),
			FORMAT('$%02X ', address[3]), FORMAT('$%02X ', address[4]),
			FORMAT('$%02X ', address[5]), FORMAT('$%02X ', address[6]),
			FORMAT('$%02X ', address[7]), FORMAT('$%02X ', address[8]),
			' - VAL : ', 
			FORMAT('$%02X ', value[1]), FORMAT('$%02X ', value[2]),
			FORMAT('$%02X ', value[3]), FORMAT('$%02X ', value[4])");
	
	SWITCH (event)
	{
		CASE BSS_SET:
		{
			STACK_VAR CHAR k
			STACK_VAR CHAR muteGeneral
			
			FOR (i=1 ; i<= NB_AUDIO_ZONES ; i++)
			{
				IF(address == bssMuteAddresses[i])
				{
					zoneMute[i] = TYPE_CAST(bytesToLong(value));
					//[a_TPTab, a_ch_Volume[((i-1)*3)+3]] = (zoneMute[i])
					RefreshMatrix(dvTP_iPad_Matrix)
					
					BREAK;
				}
				ELSE IF(address == bssSourceAddresses[i])
				{
					zoneSource[i] = TYPE_CAST(bytesToLong(value));
					
					/*
					[a_TPTab, a_ch_Source[((i-1)*3) + 1]] = (zoneSource[i] == SOURCE_STREAM);
					[a_TPTab, a_ch_Source[((i-1)*3) + 2]] = (zoneSource[i] == SOURCE_DJ_CASTI);
					[a_TPTab, a_ch_Source[((i-1)*3) + 3]] = (zoneSource[i] == SOURCE_DJ_COSTES);
					*/
					RefreshMatrix(dvTP_iPad_Matrix)
					
					BREAK;
				}
			}
		}
		
		CASE BSS_SET_PERCENT: //Received percentage value, so mainly for volume
		{
			FOR (i=1 ; i<= NB_AUDIO_ZONES ; i++)
			{
				IF(address == bssGainAddresses[i])
				{
					zoneVolume[i] = value[2];//bytesToLong(value) / 65536;
					
					//TAKE THE FRACTIONAL PART OF THE GAIN FADER TO DECIDE WHETHER TO ROUND UP OR DOWN FOR CLOSEST INTEGER
					IF ((value[3]*256 + value[4]) > 32767)
					{
						zoneVolume[i]++; //ROUND UP TO NEXT INTEGER
					}
					
					//sendVolumeLevelToTP(a_TPTab, a_l_VolumeSlider[i], zoneVolume[i]);
					// SEND_COMMAND a_TPTab, "'^TXT-', ITOA(a_ad_VolumePercentage[i]), ',0,', FORMAT('%0.0f', zoneVolume[i]), ' %'";
					RefreshMatrix(dvTP_iPad_Matrix)
					
					BREAK;
				}
			}
		}
	}
}

define_function bssParseRX (CHAR fdbk[])
{
	STACK_VAR INTEGER j; 			//RECEIVE LOOP VAR
    STACK_VAR INTEGER gotEscape; 
    STACK_VAR CHAR rSpecial; 		//RECEIVE SPECIAL CHARACTER
    STACK_VAR CHAR rChecksum; 		//RECEIVE CHECKSUM
    LOCAL_VAR CHAR baseMessage[25]; //TOTAL REAL RECEIVED MESSAGE AFTER CONVERTING SPECIAL CHARS
    STACK_VAR CHAR temp[25];		//PARSING TEMP VAR
    STACK_VAR CHAR tChecksum; 		//TRANSMITTED CHECKSUM
	
	STACK_VAR CHAR event;
    LOCAL_VAR CHAR address[8];
    LOCAL_VAR CHAR value[4];
	
	//Removes first characters	   ETX								ACK								 NAK
	WHILE(LEFT_STRING(fdbk, 1) == "$02" || LEFT_STRING(fdbk, 1) == "$06" || LEFT_STRING(fdbk, 1) == "$15")
	{
		IF (GET_BUFFER_CHAR(fdbk) == $15) //NAK Received
		{
			AMX_LOG(AMX_ERROR, "'BSS - NAK Received'");
		}
	}
	
	//Removes last character
	IF (RIGHT_STRING(fdbk, 1) == "$03")
		fdbk = LEFT_STRING(fdbk, LENGTH_STRING(fdbk) - 1);
	ELSE
	{
		AMX_LOG(AMX_ERROR, "'BSS - Received incorrect message from device'");
		RETURN;
	}
	
	temp = fdbk;
	
	//Checking the checksum
	baseMessage = "";
	rChecksum = 0;
	
	IF((MID_STRING(temp, (LENGTH_STRING(temp) - 1), 1)) = $1B) //CS IS SPECIAL CHAR
	{
		tChecksum = TYPE_CAST(RIGHT_STRING(temp, 1)) - 128;
		temp = MID_STRING(temp, 1, (LENGTH_STRING(temp) - 2));
	}
	ELSE
	{
		tChecksum = TYPE_CAST(RIGHT_STRING(temp, 1));
		temp = MID_STRING(temp, 1, (LENGTH_STRING(temp) - 1)); //THE (-1) IS TO REMOVE THE CHECKSUM FROM CALCULATIONS
	}
	
	FOR (j = 1 ; j <= LENGTH_STRING(temp) ; j++) //REPLACE SPECIAL CHARS AND GENERATE CHECKSUM
	{                               
		IF (temp[j] = "$1B") //ESCAPE CHAR
			gotEscape = 1;
		ELSE
		{
			IF (gotEscape)
			{
				rSpecial = (temp[j] - 128);
				rChecksum = rChecksum BXOR rSpecial;
				baseMessage = "baseMessage, rSpecial";
				gotEscape = 0;
			}
			ELSE
			{
				rChecksum = rChecksum BXOR temp[j];
				baseMessage = "baseMessage, temp[j]";
			}
		}
	}
	
	//MAKE SURE CHECKSUM = RECEIVED CHECKSUM AND MESSAGE IS RIGHT SIZE
	IF (rChecksum == tChecksum)
	{
		fnLOG_HEX(baseMessage, LENGTH_ARRAY(fdbk), 'BSS fbk decoded : ');
		
		//Event type is the first byte
		event = baseMessage[1]; 
		
		//Remove the event
		baseMessage = RIGHT_STRING(baseMessage, LENGTH_STRING(baseMessage) - 1);
		
		IF (event <> BSS_RECALL_PARAM_PRESET) //Should be always true since we can't get feedback for presets
		{
			address = LEFT_STRING(baseMessage, 8); 
			value = RIGHT_STRING(baseMessage, LENGTH_STRING(baseMessage) - 8);
			
			//Send to the project specific function for parsing
			bssFeedbackAnalysis(event, address, value);
		}
	}
	ELSE
	{
		AMX_LOG(AMX_ERROR, "'BSS - Received incorrect checksum from device'");
		RETURN;
	}
}

DEFINE_FUNCTION RefreshMatrix(DEV _dvTV)
{

	stack_var char i
	
	IF(ZoneSelected)
	{		
		SEND_LEVEL _dvTV, a_l_VolumeMatrix, atoi((ftoa(zoneVolume[ZoneSelected])))
		[_dvTV, a_ch_VolumeMatrix[3]] = (zoneMute[ZoneSelected])

		for(i=1;i<=NB_AUDIO_ZONES;i++)
			[_dvTV, a_ch_ZoneMatrix[i]] = (ZoneSelected == i)
	}
	ELSE
	{		
		SEND_LEVEL _dvTV, a_l_VolumeMatrix, 0
		OFF[_dvTV, a_ch_VolumeMatrix[3]]
		
		OFF[_dvTV,a_ch_ZoneMatrix]
	}

}

DEFINE_CALL 'Debug' (INTEGER logLevel, CHAR message[])
{
	AMX_LOG(logLevel, "'Otomis_BSS_comm (', ITOA(dvBSS.PORT), ') - ', message")
}

DEFINE_EVENT

DATA_EVENT[dvAMX]
{
	ONLINE:
	{
		IP_CLIENT_OPEN(dvBSS.PORT, BSSipAddress, BSS_CLIENT_PORT, IP_TCP)
	}
}

DATA_EVENT[dvBSS]
{
	ONLINE:
	{
		CALL 'Debug' (AMX_DEBUG, 'Socket opened')

		TIMELINE_CREATE(TIMELINE_BSS_QUEUE, BSS_STRING_SEND_TIME, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT);
		
		WAIT 100 
		{
			bssInitSubscriptions(DATA.DEVICE);
		}		
	}

	OFFLINE:
	{
		CALL 'Debug' (AMX_DEBUG, 'Socket closed')
		
		IP_CLIENT_CLOSE(dvBSS.PORT)
		WAIT 100 IP_CLIENT_OPEN (dvBSS.PORT, BSSipAddress, BSS_CLIENT_PORT, IP_TCP)
	}

    ONERROR:
    {
		SWITCH (DATA.NUMBER)
		{
			CASE  1:  // invalid server address
			CASE  2:  // invalid server port
			CASE  3:  // invalid value for Protocol
			CASE  4:  // unable to open communication port with server
			CASE  6:  // Connection refused
			CASE  7:  // Connection timed out
			CASE  8:  // Unknown connection error
			CASE  9:  // Already closed
			CASE 10:  // Binding error
			CASE 11:  // Listening error
			CASE 16:  // Too many open sockets
			{
				CALL 'Debug' (AMX_ERROR, "'Connection error : ', ITOA(DATA.NUMBER)")
				WAIT 100 IP_CLIENT_OPEN (dvBSS.PORT, BSSipAddress, BSS_CLIENT_PORT, IP_TCP)
			}
		}
	}
	
	STRING:
	{
		bssReceiveBuffer = "bssReceiveBuffer, DATA.TEXT";
		WHILE (FIND_STRING(bssReceiveBuffer, "BSS_QUEUE_SEPARATOR", 1) != 0)
			bssParseRX(REMOVE_STRING(bssReceiveBuffer, "BSS_QUEUE_SEPARATOR", 1));
	}
}
	
TIMELINE_EVENT[TIMELINE_BSS_QUEUE]
{
	//Queue processing
	IF(FIND_STRING(bssCommandQueue, "BSS_QUEUE_SEPARATOR", 1) != 0)	//the queue is not empty 
	{
		SEND_STRING dvBSS, REMOVE_STRING(bssCommandQueue, "BSS_QUEUE_SEPARATOR", 1);
	}
}	

