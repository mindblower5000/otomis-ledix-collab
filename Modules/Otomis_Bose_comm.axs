MODULE_NAME='Otomis_Bose_comm'(DEV vdvBose, DEV dvBose, CHAR ipAddress[], CHAR zone_name[][], CHAR output[] ,FLOAT volume[], CHAR mute[], CHAR power_off_input)

#INCLUDE '_utils'

//--------------
// 05/2023 - JA
//--------------
// Module de pilotage ControlSpace Bose

DEFINE_CONSTANT
    
BOSE_CLIENT_PORT 	= 10055;

//Volume limits
MIN_VOL_LEVEL = -60.0
MAX_VOL_LEVEL = 0.0

MIN_TP_VOL = 0.0
MAX_TP_VOL = 100.0
	
DEFINE_VARIABLE

//Reception buffer
CHAR receiveBuffer[1000]

#INCLUDE '_utils2'
#INCLUDE 'math'

DEFINE_CALL 'Debug' (INTEGER logLevel, CHAR message[])
{
	AMX_LOG(logLevel, "'Otomis_Bose_comm (', ITOA(dvBose.PORT), ') - ', message")
}

DEFINE_FUNCTION sendCommand(CHAR message[])
{
    SEND_STRING dvBose, "message,$0D";
	
	CALL 'Debug'(AMX_DEBUG, "'Command Sent: ',message")
}
DEFINE_FUNCTION FeedbackAnalysis (CHAR fdbk[])
//Parses the feedback from the BOSE
{
	STACK_VAR CHAR cmd[10], zone[10], params[30]
	STACK_VAR index

	//Coming from the device : 'GA"Selector 201 Ch">1=2',$0D

	//Removes GA -> '"Selector 201 Ch">1=2',$0D
	REMOVE_STRING(fdbk, "'GA'", 1)
	
	//Remove "$0D at the end  -> '"Selector 201 Ch">1=2'
	fdbk = LEFT_STRING(fdbk, LENGTH_STRING(fdbk) - 2)
	
	IF (LEFT_STRING(fdbk, 1) == "'"'")
	{
		CALL 'Debug'(AMX_DEBUG, "'Parsed received string : ', fdbk")
		
		//Extract the first part of the message -> '"Selector ' & '201 Ch">' & '1=2'
		cmd = REMOVE_STRING(fdbk, "' '", 1)
		zone = REMOVE_STRING(fdbk, "'>'", 1)
		params = fdbk
		
		//Remove the '"' & '">' -> 'Selector ' & '201 Ch' & '1=2'
		REMOVE_STRING(cmd, "'"'", 1)
		zone = LEFT_STRING(zone, LENGTH_STRING(zone) - 2)
		index = find_index(UPPER_STRING(zone))
		
		IF(index <> 0)
		{
			SWITCH (cmd)
			{
				CASE 'Selector ': //Selector feedback
				{
					//Extract input value -> 'Selector ' & '201 Ch' & '2'
					REMOVE_STRING(params, "'='", 1)
					
					output[index] = ATOI(params)
				}
				
				CASE 'Volume ': //Volume feedback
				{
					//Extract volume cmd type & value -> '1=' & '201 Ch' & '-45'
					cmd = REMOVE_STRING(params, "'='", 1)
					
					SWITCH (cmd)
					{
						CASE '1=': //Volume Level
						{
							volume[index] = convertFromDevVolume(params)
							
							SEND_STRING vdvBose, "'VOLUME:',itoa(index),':',itoa(volume[index])"
						}
						CASE '2=': //Volume Mute
						{
							SWITCH (params)
							{
								CASE 'O': mute[index] = TRUE
								CASE 'F': mute[index] = FALSE
							}
						}
					}
				}
			}
		}
		ELSE
			CALL 'Debug'(AMX_ERROR, 'Error : Unknown zone')
	}
	ELSE 
		CALL 'Debug'(AMX_WARNING, "'Strange string coming : ', fdbk")
}
DEFINE_FUNCTION CHAR find_index(CHAR name[])
{
	stack_var char i
	
	for(i=1;i<=LENGTH_ARRAY(zone_name);i++)
	{
		if(name == UPPER_STRING(zone_name[i]))
			return i
	}
	return 0
}
DEFINE_FUNCTION FLOAT convertFromDevVolume (CHAR volume[])
//Converts a volume level sent by the device to a 0-100 range
{	
	return (ATOF(volume) + fabs(MIN_VOL_LEVEL))/((MAX_VOL_LEVEL + fabs(MIN_VOL_LEVEL))/(MAX_TP_VOL + fabs(MIN_TP_VOL)));
}
DEFINE_FUNCTION CHAR[6] convertToDevVolume (CHAR volume[6])
//Converts a a 0-100 range volume to the volume level required by the device
{
	DOUBLE temp
	
	temp = round(MIN_VOL_LEVEL + (ATOF(volume) * ((MAX_VOL_LEVEL - MIN_VOL_LEVEL) / 100)))
		
	IF (temp < MIN_VOL_LEVEL) 
		RETURN FORMAT('%1.0f', MIN_VOL_LEVEL)
	ELSE IF (temp > MAX_VOL_LEVEL) 
		RETURN FORMAT('%1.0f', MAX_VOL_LEVEL)
	ELSE 
		RETURN FORMAT('%1.0f', temp)
}

DEFINE_EVENT

DATA_EVENT[0:1:0]
{
    ONLINE:
    {	
		IP_CLIENT_OPEN(dvBose.PORT, ipAddress, BOSE_CLIENT_PORT, IP_TCP);
	}
}


DATA_EVENT[dvBose]
{
	ONLINE:
	{
		CALL 'Debug' (AMX_DEBUG, 'Socket opened')		
	}

	OFFLINE:
	{
		CALL 'Debug' (AMX_DEBUG, 'Socket closed')
		
		IP_CLIENT_CLOSE(dvBose.PORT)
		WAIT 100 IP_CLIENT_OPEN (dvBose.PORT, ipAddress, BOSE_CLIENT_PORT, IP_TCP)
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
				WAIT 100 IP_CLIENT_OPEN (dvBose.PORT, ipAddress, BOSE_CLIENT_PORT, IP_TCP)
			}
		}
	}
	
	STRING:
	{
		LOCAL_VAR CHAR str[300]

		str = DATA.TEXT
		
		receiveBuffer = "receiveBuffer, DATA.TEXT"
		WHILE (FIND_STRING(receiveBuffer, "';',$0D", 1) != 0)
			FeedbackAnalysis(REMOVE_STRING(receiveBuffer, "';',$0D", 1))
		
		CALL 'Debug'(AMX_DEBUG, "'Command Received: ',str")
	}
}

DATA_EVENT[vdvBose]
{
    STRING:
	{
		// TEST TODO ---------------------------------------
		/*LOCAL_VAR CHAR str[300]

		str = DATA.TEXT
		
		receiveBuffer = "receiveBuffer, DATA.TEXT"
		WHILE (FIND_STRING(receiveBuffer, "';',$0D", 1) != 0)
			FeedbackAnalysis(REMOVE_STRING(receiveBuffer, "';',$0D", 1))
		
		CALL 'Debug'(AMX_DEBUG, "'Command Received: ',str")
		*/// TEST ---------------------------------------
		
	}
	
	COMMAND:
    {
		STACK_VAR CHAR str[500]
		STACK_VAR CHAR tab[10][50]

		str = UPPER_STRING(DATA.TEXT)

		//String splitting
		IF (FIND_STRING(str, ':', 1) <> 0)
		{
			StringSplit(str, ':', tab)

			SWITCH (tab[1])
			{
				CASE 'POWER': 		/// 'Power Off' Input [6.1.38 SOURCE SELECTOR Module PAGE-54]
				{
					stack_var index
					
					index = atoi(tab[2])
					
					IF(index <= LENGTH_ARRAY(zone_name))
					{
						SWITCH(tab[3])
						{
							CASE 'OFF':
							{
								sendCommand("'SA','"Selector ',zone_name[index],'">1=',itoa(power_off_input)")
								sendCommand("'GA','"Selector ',zone_name[index],'">1'")
								
								sendCommand("'SA','"Volume ',zone_name[index],'">2=F'")
								sendCommand("'GA','"Volume ',zone_name[index],'">2'")
							}
						}
					}
					ELSE
						CALL 'Debug'(AMX_ERROR, 'Error : Unknown POWER zone')
				}
				
				CASE 'SELECTOR': 		// 'SELECTOR:1:5' --> Set Source Selector module “Zone-1” to input 5 [6.1.38 SOURCE SELECTOR Module PAGE-54]
				{
					stack_var index
					
					index = atoi(tab[2])
					
					IF(index <= LENGTH_ARRAY(zone_name))
					{
						sendCommand("'SA','"Selector ',zone_name[index],'">1=',tab[3]")
						sendCommand("'GA','"Selector ',zone_name[index],'">1'")
					}
					ELSE
						CALL 'Debug'(AMX_ERROR, 'Error : Unknown SELECTOR zone')
				}
				
				CASE 'VOLUME':
				{				
					stack_var index
							
					index = atoi(tab[2])
					
					SWITCH (tab[3])
					{
						CASE 'MUTE':	// 'VOLUME:1:MUTE' -->  toogle mute state of Gain module “Zone-1” [6.1.26 GAIN Module PAGE-44]
						{
							IF(index <= LENGTH_ARRAY(zone_name))
							{
								IF (tab[4] == 'TOGGLE')
									sendCommand("'SA','"Volume ',zone_name[index],'">2=T'")
								ELSE IF (tab[4] == 'ON')
									sendCommand("'SA','"Volume ',zone_name[index],'">2=O'")
								ELSE IF (tab[4] == 'OFF')
									sendCommand("'SA','"Volume ',zone_name[index],'">2=F'")
								ELSE
									CALL 'Debug'(AMX_ERROR, 'Error : Unknown VOLUME:MUTE command')
							}
							ELSE
								CALL 'Debug'(AMX_ERROR, 'Error : Unknown VOLUME zone')
							
							sendCommand("'GA','"Volume ',zone_name[index],'">2'")

						}
						
						CASE 'UP':		// 'VOLUME:Zone-1:UP'
						{
							IF(index <= LENGTH_ARRAY(zone_name))
							{
								IF(volume[index] < 99)
									SEND_COMMAND vdvBose, "'VOLUME:',itoa(index),':',itoa(volume[index] + 2)"
								ELSE
									SEND_COMMAND vdvBose, "'VOLUME:',itoa(index),':100'"
									
								sendCommand("'SA','"Volume ',zone_name[index],'">2=F'")
								sendCommand("'GA','"Volume ',zone_name[index],'">2'")
							}
							ELSE
								CALL 'Debug'(AMX_ERROR, 'Error : Unknown VOLUME zone')
						}
						
						CASE 'DOWN':
						{
							IF(index <= LENGTH_ARRAY(zone_name))
							{
								IF(volume[index] > 2)
									SEND_COMMAND vdvBose, "'VOLUME:',itoa(index),':',itoa(volume[index] - 2)"
								ELSE
									SEND_COMMAND vdvBose, "'VOLUME:',itoa(index),':1'"
									
								sendCommand("'SA','"Volume ',zone_name[index],'">2=F'")
								sendCommand("'GA','"Volume ',zone_name[index],'">2'")
							}
							ELSE
								CALL 'Debug'(AMX_ERROR, 'Error : Unknown VOLUME zone')
						}
						
						DEFAULT:
						{
							STACK_VAR CHAR _vol
							
							IF(index <= LENGTH_ARRAY(zone_name))
							{
								_vol = ATOI(tab[3])
								
								IF (_vol == 0)
									CALL 'Debug'(AMX_ERROR, 'Error : Use VOLUME:MUTE:ON instead of VOLUME:0')
								ELSE IF (_vol > 100)
									CALL 'Debug'(AMX_ERROR, 'Error : Max volume is 100')
								ELSE
								{
									sendCommand("'SA','"Volume ',zone_name[index],'">1=',convertToDevVolume(tab[3])")
									sendCommand("'GA','"Volume ',zone_name[index],'">1'")
									
									sendCommand("'SA','"Volume ',zone_name[index],'">2=F'")
									sendCommand("'GA','"Volume ',zone_name[index],'">2'")
								}
							}
							ELSE
								CALL 'Debug'(AMX_ERROR, 'Error : Unknown VOLUME zone')
						}					
					}
				}	
			}
		}
    }
}
