MODULE_NAME='Otomis_LutronQSX_ui' (DEV vdvLutron, DEV interfaces[], INTEGER loadCommands[], INTEGER fdbkLvlCodes[], INTEGER actLvlCodes[], INTEGER zoneCommands[])

/*
	Homeworks QSX UI module
	-------------------------------
	Author : 	JA
	Version : 	1.0
	Date : 		2022-09-15
	
	Release notes:
		v1.1:	LEVEL_EVENT[interfaces,	actLvlCodes] modification
				- Fake feeback on bargraph
				- Only send the load command when stop palying with the bargraph
		v1.0: Creation
*/

/*
	Required in order to use string handling functions
*/
#INCLUDE '_utils'

DEFINE_TYPE

//Structure defining a Lutron QS load
STRUCTURE QS_LOAD
{
	//Integration ID, according to QS programming
	LONG integrationID		
	//Load name
	CHAR name[50]	
	//Zone index
	CHAR room
	//Load type : 0 = Dim ; 1 = On/off
	CHAR type
	//Power on level
	INTEGER lightOnLevel
	
	//Feedback Level Code in TPDesign
	INTEGER levelCodeFdbk	
	//Action Level Code in TPDesign
	INTEGER levelCodeAction	
	//Load level value
	SINTEGER levelValue	
	//Channel Code of the On/Off button in TPDesign, + 1 for the + button, + 2 for the - button	
	INTEGER groupChannel	
}

DEFINE_CONSTANT

//Maximum array sizes
MAX_LOAD_COUNT = 200
MAX_TP_COUNT = 20
MAX_ROOMS = 30

//Load types
DIMMED_LOAD = 0
ONOFF_LOAD = 1

//Initialization timeline ID
TIML_ID = 4973

DEFINE_VARIABLE

//Array containing all the loads
QS_LOAD _loadArray[MAX_LOAD_COUNT] 

//Array containing the verbose room names
CHAR _roomNames[MAX_ROOMS][MAX_ROOMS]

//Stores the state of the touch panels
CHAR _tpOnline[MAX_TP_COUNT]

//Stores the effective project load count
LONG _realLoadCount = MAX_LOAD_COUNT

//Default on level during the array initialization
CHAR _defaultOnLevel = 90

//Dim step for +/- buttons
CHAR _dimStep = 5


//Time interval for the initialization requests
LONG interval[1] = {500}

//Pairing Status
// If pairing need to be reset --> SEND_COMMAND vdvDuetHWI,"'LUTRON.PAIR.RESET'"
CHAR PairingStatus[300]


DEFINE_CALL 'Debug' (INTEGER logLevel, CHAR message[])
{
	AMX_LOG(logLevel, "'Otomis_LutronQSX_ui - ', message")
}


/*
	Initializes the load array to default values.
	It also prepares the TPDesign channel and level codes.
*/
DEFINE_CALL 'initStart'()  // !!!!!! NOT TESTED !!!!!! 
{
	LOCAL_VAR k
	
	CALL 'Debug'(AMX_INFO, 'Initialization begins...')
	
	FOR (k = 1 ; k <= _realLoadCount ; k++)
	{
		_loadArray[k].levelCodeFdbk = fdbkLvlCodes[1] - 1 + k
		_loadArray[k].levelCodeAction = actLvlCodes[1] - 1 + k
		_loadArray[k].groupChannel = loadCommands[1] + ((k-1) * 3)
		_loadArray[k].levelValue = 0
		
		_loadArray[k].type = DIMMED_LOAD
		_loadArray[k].lightOnLevel = _defaultOnLevel
	}
}

/*
	Once the load array initialized, asks the Lutron processor 
	the effective load levels.
*/
DEFINE_CALL 'initEnd'()
// Load list initialization
{
	WAIT 20 TIMELINE_CREATE (TIML_ID, interval, 1, TIMELINE_ABSOLUTE, TIMELINE_REPEAT)
}

DEFINE_CALL 'printArray'()
{
	SLONG fileHandle
	
	//Load report
	CALL 'Debug'(AMX_INFO, 'Creating the load report...')
	fileHandle = FILE_OPEN('LutronQS_Load_Report.csv', 2)
	
	IF (fileHandle <= 0)
		CALL 'Debug' (AMX_ERROR, 'Error while opening the file')
	ELSE
	{
		LOCAL_VAR i
		STACK_VAR CHAR line2Write[300]
		
		FILE_WRITE_LINE(fileHandle, 'Id,Name,Room,Load Type,On/Off Channel,Active level code,Feedback level code', 75)
		
		FOR (i = 1 ; i <= _realLoadCount ; i++)
		{
			line2Write = "ITOA(i), ','"
			line2Write = "line2Write, _loadArray[i].name, ','"
			line2Write = "line2Write, _roomNames[_loadArray[i].room], ','"
			
			IF(_loadArray[i].type == ONOFF_LOAD)
				line2Write = "line2Write, 'SWI', ','"
			ELSE
				line2Write = "line2Write, 'DIM', ','"
			
			line2Write = "line2Write, ITOA(_loadArray[i].groupChannel), ','"
			line2Write = "line2Write, ITOA(_loadArray[i].levelCodeAction), ','"
			line2Write = "line2Write, ITOA(_loadArray[i].levelCodeFdbk)"
			
			FILE_WRITE_LINE(fileHandle, line2Write, LENGTH_STRING(line2Write))
		}
		
		
		FILE_CLOSE(fileHandle)
		CALL 'Debug'(AMX_INFO, 'Load report created !')		
	}
	
	
	//Zone Control report
	CALL 'Debug'(AMX_INFO, 'Creating the zone control report...')
	fileHandle = FILE_OPEN('LutronQS_ZoneControl_Report.csv', 2)
	
	IF (fileHandle <= 0)
		CALL 'Debug' (AMX_ERROR, 'Error while opening the file')
	ELSE
	{
		LOCAL_VAR i
		STACK_VAR CHAR line2Write[300]
		
		FILE_WRITE_LINE(fileHandle, 'Id,Name,Channel', 15)
		
		FOR (i = 1 ; i <= MAX_ROOMS ; i++)
		{
			line2Write = "ITOA(i), ','"
			line2Write = "line2Write, _roomNames[i], ','"
			line2Write = "line2Write, ITOA(zoneCommands[((i - 1) * 4) + 1])"
			
			FILE_WRITE_LINE(fileHandle, line2Write, LENGTH_STRING(line2Write))
		}
		
		
		FILE_CLOSE(fileHandle)
		CALL 'Debug'(AMX_INFO, 'Zone control report created !')		
	}
	
	CALL 'Debug'(AMX_INFO, 'Reports created ! FTP the master to get the CSV files')
}


/*
	Finds the array index according to the integration ID.
	
	Returns the array index of the line which contains the integrationID, 
	0 if not found.
*/
DEFINE_FUNCTION INTEGER findWithIntegrationID (LONG integrationID)
{
	LOCAL_VAR i
	FOR (i = 1 ; i <= _realLoadCount ; i++)
	{
		IF (_loadArray[i].integrationID == integrationID)
			RETURN i
	}
	RETURN 0
}

/*
	Finds the array index according to the group channel.
	
	Returns the array index of the line which contains the group channel, 
	0 if not found.
*/
DEFINE_FUNCTION INTEGER findWithGroupChannel (INTEGER groupChannel)
{
	LOCAL_VAR i
	FOR (i = 1 ; i <= _realLoadCount ; i++)
	{
		IF (_loadArray[i].groupChannel == groupChannel)
			RETURN i
	}
	RETURN 0
}

/*
	Finds the array index according to the action level code.
	
	Returns the array index of the line which contains the action level code, 
	0 if not found.
*/
DEFINE_FUNCTION INTEGER findWithActionLevelCode (INTEGER actionLevelCode)
{
	LOCAL_VAR i
	FOR (i = 1 ; i <= _realLoadCount ; i++)
	{
		IF (_loadArray[i].levelCodeAction == actionLevelCode)
			RETURN i
	}
	RETURN 0
}

/*
	Finds the array index of the TP.
	
	Returns the array index, 0 if not found.
*/
DEFINE_FUNCTION INTEGER tpIndex (DEV tp)
{
	LOCAL_VAR i
	FOR (i = 1 ; i <= MAX_TP_COUNT ; i++)
	{
		IF (interfaces[i] == tp)
			RETURN i
	}
	RETURN 0
}

/*
	Finds the array index of the verbose room name
	
	Returns the array index, 0 if not found.
*/
/*DEFINE_FUNCTION INTEGER roomNameToRoomCode (CHAR roomName[])
{
	LOCAL_VAR i
	FOR (i = 1 ; i <= LENGTH_ARRAY(_roomNames) ; i++)
	{
		IF (_roomNames[i] == roomName)
			RETURN i
	}
	RETURN 0
}*/

DEFINE_FUNCTION controlZoneLoads (INTEGER zoneID, INTEGER value)
{
	LOCAL_VAR i
	FOR (i = 1 ; i <= _realLoadCount ; i++)
	{
		IF (_loadArray[i].room == zoneID)
		{			
			IF ((_loadArray[i].type == ONOFF_LOAD) && (value <> 0))				
				SEND_COMMAND vdvLutron, "'L:S:', ITOA(_loadArray[i].integrationID), ':', '100'"
			ELSE IF ((_loadArray[i].type == ONOFF_LOAD) && (value == 0))	
				SEND_COMMAND vdvLutron, "'L:S:', ITOA(_loadArray[i].integrationID), ':', '0'"
			ELSE
				SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[i].integrationID), ':', ITOA(value)"
		}
	}
}

/*
	Sends the load levels to the touch panel.
*/
DEFINE_FUNCTION RefreshLighting(DEV dvTP)
{
	LOCAL_VAR i
	
	FOR (i = 1 ; i <= _realLoadCount ; i++)
	{
		//Feedback for bargraph
		SEND_LEVEL dvTP, _loadArray[i].levelCodeFdbk, _loadArray[i].levelValue
		
		//Feedback for on/off
		[dvTP, _loadArray[i].groupChannel] = (_loadArray[i].levelValue)
	}
}

DEFINE_EVENT

/*
	Tracks the online/offline state of the touch panels.
*/
DATA_EVENT[interfaces]
{
	ONLINE:
	{
		_tpOnline[tpIndex(DATA.DEVICE)] = TRUE
		RefreshLighting(DATA.DEVICE)
	}
	
	OFFLINE:
	{
		_tpOnline[tpIndex(DATA.DEVICE)] = FALSE
	}	
}

DATA_EVENT[vdvLutron]
{
	/*
		Handles the virtual device string feedbacks.
		Used to update the light levels in the AMX program and Pairing Status
	*/
	STRING:
	{
		STACK_VAR CHAR str[300]
		STACK_VAR CHAR tab[10][30]
		str = UPPER_STRING(DATA.TEXT)
		
		IF (FIND_STRING(str,'PAIRING:',1))	// PAIRING STATUS FEEDBACK BETWEEN AMX & LUTRON
		{
			remove_string(str,'PAIRING:',1)
			PairingStatus = str
		}
		
		ELSE IF (FIND_STRING(str, ':', 1) <> 0) 
		{
			StringSplit(str, ':', tab)
			
			SWITCH (tab[1])
			{
				//Lighting Dimmed (0 to 100) and Switched (0 or 100) Feedbacks
				CASE 'L':
				{
					STACK_VAR index
					index = findWithIntegrationID(ATOI(tab[3]))
					
					IF (index == 0)
						CALL 'Debug'(AMX_WARNING, "'No item found for the Integration ID ', tab[3]")
					ELSE
					{
						SWITCH (tab[2])						
						{
							CASE 'D':
							{
								_loadArray[index].levelValue = ATOI(tab[4])
								
								//Feedback for bargraph
								SEND_LEVEL interfaces, _loadArray[index].levelCodeFdbk, _loadArray[index].levelValue
								
								//Feedback for on/off
								[interfaces, _loadArray[index].groupChannel] = (_loadArray[index].levelValue)								
								
								CALL 'Debug'(AMX_DEBUG, "_roomNames[_loadArray[index].room], ' - ', _loadArray[index].name, ' (', FTOA(_loadArray[index].levelValue), ')'")
							}
						}
					}
				}
			}
		}
	}
	
	/*
		Parses the initialization commands sent in the initLutron call.
		Please refer to the command list in the workspace.	
	*/
	COMMAND:
	{
		LOCAL_VAR CHAR uStr[300]
		STACK_VAR CHAR tab[10][30]
		uStr = UPPER_STRING(DATA.TEXT)
		
		IF (uStr == 'PRINT_SUMMARY')
		{
			CALL 'printArray'
		}
		
		IF ((LEFT_STRING(uStr, 4) == 'INIT') && (FIND_STRING(uStr, ':', 1) <> 0))
		{
			StringSplit(uStr, ':', tab)			
			SWITCH (tab[2])
			{
				CASE 'START':
				{
					CALL 'initStart'
				}
				
				CASE 'END':
				{
					CALL 'initEnd'
				}
				
				CASE 'DEFAULT_ON':
				{
					IF (ATOI(tab[3]) <> 0)
					{
						_defaultOnLevel = ATOI(tab[3])						
						CALL 'Debug'(AMX_INFO, "'Default on level OK (', ITOA(_defaultOnLevel), ')'")
					}
					ELSE
						CALL 'Debug'(AMX_ERROR, 'Default_on setting not correct')
				}
				
				CASE 'DEFAULT_DIM_STEP':
				{
					IF (ATOI(tab[3]) <> 0)
					{
						_dimStep = ATOI(tab[3])						
						CALL 'Debug'(AMX_INFO, "'Default dim step OK (', ITOA(_dimStep), ')'")
					}
					ELSE
						CALL 'Debug'(AMX_ERROR, 'Default_dim_step setting not correct')
				}
				
				CASE 'LOAD_COUNT':
				{
					IF (ATOI(tab[3]) <> 0)
					{
						_realLoadCount = ATOI(tab[3])
						SET_LENGTH_ARRAY(_loadArray, _realLoadCount)						
						CALL 'Debug'(AMX_INFO, "'Load count OK (', ITOA(_realLoadCount), ')'")
					}
					ELSE
						CALL 'Debug'(AMX_ERROR, 'Load_count setting not correct')
				}
				
				
				(*
					String pattern
					3. array index
					4. load name
					5. integration ID
					6. room ID
					7. opt. NON_DIM or onLevel	
				*)
				CASE 'LOAD':
				{
					STACK_VAR INTEGER index		
					index = ATOI(tab[3])
					
					IF (index == 0)
						CALL 'Debug' (AMX_ERROR, 'Bad load initialization, index not correct')
					ELSE
					{					
						_loadArray[index].name = tab[4]
						_loadArray[index].integrationID = ATOI(tab[5])
						_loadArray[index].room = ATOI(tab[6])
						
						//Optional parameter (non dim or light on level)
						IF (LENGTH_STRING(tab[7]) <> 0)
						{
							IF (tab[7] == 'NON_DIM')
								_loadArray[index].type = ONOFF_LOAD
								
							ELSE IF (ATOI(tab[7]) <> 0)
								_loadArray[index].lightOnLevel = ATOI(tab[7])
								
						}
						
						// LOAD SUBSCRIBE FOR DIMMED AND SWICHED LIGHTS
						SEND_COMMAND vdvLutron,"'L:D:',tab[5],':S'"
					}
				}
				
				(*
					String pattern
					3. array index
					4. room name
				*)
				CASE 'ROOM_NAME':
				{
					STACK_VAR INTEGER index		
					index = ATOI(tab[3])
					
					_roomNames[index] = tab[4]
					
					CALL 'Debug'(AMX_INFO, "'Room name set (', ITOA(index), ') : ', tab[4]")
				}
			}
		}
		
		ELSE IF ((LEFT_STRING(uStr, 2) == 'UI') && (FIND_STRING(uStr, ':', 1) <> 0))
		{
			StringSplit(uStr, ':', tab)			
			SWITCH (tab[2])
			{
				CASE 'ZONE_CONTROL':
				{
					STACK_VAR INTEGER zoneIndex, value
					zoneIndex = ATOI(tab[3])
					value = ATOI(tab[4])
					
					controlZoneLoads(zoneIndex, value)
					
					CALL 'Debug'(AMX_DEBUG, "'Zone control for ', _roomNames[zoneIndex], ' at ', tab[4], ' %'")
				}
			}
		}
	}
}


/*
	Handles the touch panel buttons presses for on/off, +, -
*/
BUTTON_EVENT[interfaces, loadCommands]
{
	PUSH:
	{
		LOCAL_VAR index
		LOCAL_VAR action
		
		action = (BUTTON.INPUT.CHANNEL - loadCommands[1] + 1) % 3
		
		SWITCH (BUTTON.INPUT.CHANNEL - loadCommands[1] + 1)
		{
			DEFAULT:
			{
				SWITCH (action)
				{			
					CASE 1:	//ON/OFF
						index = findWithGroupChannel(BUTTON.INPUT.CHANNEL - 0)
					
					CASE 2:	//+
						index = findWithGroupChannel(BUTTON.INPUT.CHANNEL - 1)
					
					CASE 0:	//-	
						index = findWithGroupChannel(BUTTON.INPUT.CHANNEL - 2)			
				}
				
				IF (index == 0)
					CALL 'Debug'(AMX_ERROR, "'No item found for the TP button ', ITOA(BUTTON.INPUT.CHANNEL)")
				ELSE
				{
					SWITCH (action)
					{			
						CASE 1:	//ON/OFF
						{
							IF (_loadArray[index].levelValue == 0)
							{
								IF (_loadArray[index].type == ONOFF_LOAD)
									SEND_COMMAND vdvLutron, "'L:S:', ITOA(_loadArray[index].integrationID), ':100'"
								ELSE
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':', ITOA(_loadArray[index].lightOnLevel)"
							}
							ELSE
							{
								IF (_loadArray[index].type == ONOFF_LOAD)
									SEND_COMMAND vdvLutron, "'L:S:', ITOA(_loadArray[index].integrationID), ':0'"
								ELSE
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':0'"
							}
						}
						
						CASE 2:	//+
						{
							IF (_loadArray[index].type == DIMMED_LOAD)
							{
								IF (_loadArray[index].levelValue <= (100 - _dimStep))
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':', ITOA(_loadArray[index].levelValue + _dimStep)"
								ELSE
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':100'"
							}
						}
						
						CASE 0:	//-	
						{
							IF (_loadArray[index].type == DIMMED_LOAD)
							{
								IF (_loadArray[index].levelValue >= _dimStep)
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':', ITOA(_loadArray[index].levelValue - _dimStep)"
								ELSE
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':0'"
							}
						}
					}	
				}
			}
		}
	}
	
	HOLD[3, REPEAT]:
	{
		LOCAL_VAR index
		LOCAL_VAR action		
		
		action = (BUTTON.INPUT.CHANNEL - loadCommands[1] + 1) % 3
		
		SWITCH (BUTTON.INPUT.CHANNEL - loadCommands[1] + 1)
		{
			DEFAULT:
			{
				SWITCH (action)
				{			
					CASE 2:	//+
						index = findWithGroupChannel(BUTTON.INPUT.CHANNEL - 1)
					
					CASE 0:	//-	
						index = findWithGroupChannel(BUTTON.INPUT.CHANNEL - 2)			
				}
				
				IF (index == 0)
					CALL 'Debug'(AMX_ERROR, "'No item found for the TP button ', ITOA(BUTTON.INPUT.CHANNEL)")
				ELSE
				{
					SWITCH (action)
					{			
						CASE 2:	//+
						{
							IF (_loadArray[index].type == DIMMED_LOAD)
							{
								IF (_loadArray[index].levelValue <= (100 - _dimStep))
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':', ITOA(_loadArray[index].levelValue + _dimStep)"
								ELSE
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':100'"
							}
						}
						
						CASE 0:	//-	
						{
							IF (_loadArray[index].type == DIMMED_LOAD)
							{
								IF (_loadArray[index].levelValue >= _dimStep)
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':', ITOA(_loadArray[index].levelValue - _dimStep)"
								ELSE
									SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':0'"
							}
						}
					}	
				}
			}
		}
	}
}

BUTTON_EVENT[interfaces, zoneCommands]
{
	PUSH:
	{
		STACK_VAR INTEGER zoneIndex, action
		
		action = (GET_LAST(zoneCommands) - 1) % 4
		zoneIndex = ((GET_LAST(zoneCommands) - 1) / 4) + 1
		
		SWITCH (zoneIndex)
		{
			DEFAULT:
			{
				SWITCH (action)
				{			
					CASE 0:	//Full
					{
						CALL 'Debug'(AMX_DEBUG, "'Zone command sent : ', _roomNames[zoneIndex], ' : Full'")
						controlZoneLoads(zoneIndex, 90)
					}
					
					CASE 1:	//Medium
					{
						CALL 'Debug'(AMX_DEBUG, "'Zone command sent : ', _roomNames[zoneIndex], ' : Medium'")
						controlZoneLoads(zoneIndex, 60)
					}
					
					CASE 2:	//Soft
					{
						CALL 'Debug'(AMX_DEBUG, "'Zone command sent : ', _roomNames[zoneIndex], ' : Soft'")
						controlZoneLoads(zoneIndex, 30)
					}
					
					CASE 3:	//Off
					{
						CALL 'Debug'(AMX_DEBUG, "'Zone command sent : ', _roomNames[zoneIndex], ' : Off'")
						controlZoneLoads(zoneIndex, 0)
					}
				}
			}
		}
	}
}

/*
	Handles the touch panel active levels actions.
*/
LEVEL_EVENT[interfaces,	actLvlCodes]
{
	LOCAL_VAR index	
	index = findWithActionLevelCode(LEVEL.INPUT.LEVEL)
	
	//Feedback for bargraph
	SEND_LEVEL interfaces, _loadArray[index].levelCodeFdbk, LEVEL.VALUE
	
	CANCEL_WAIT 'lightingFlood';
		
	WAIT 1 'lightingFlood'
	{
		IF (index == 0)
			CALL 'Debug'(AMX_ERROR, "'No item found for the level code ', ITOA(LEVEL.INPUT.LEVEL)")
		ELSE
		{
			//Avoids level 0 on the touch panels offline
			IF ((_tpOnline[tpIndex(LEVEL.INPUT.DEVICE)]) && (_loadArray[index].type == DIMMED_LOAD))
			{
				IF ((LEVEL.VALUE > 100) || (LEVEL.VALUE < 0))
					CALL 'Debug' (AMX_ERROR, 'Incorrect level value. Must be between 0 and 100')
				ELSE
					SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[index].integrationID), ':', ITOA(LEVEL.VALUE)"
			}
		}
	}
}

/*
	Timeline requesting the level of each load to the Lutron processor
*/
TIMELINE_EVENT[TIML_ID]
{
	IF (TIMELINE.REPETITION < _realLoadCount)
		SEND_COMMAND vdvLutron, "'L:D:', ITOA(_loadArray[TIMELINE.REPETITION + 1].integrationID), ':', '?'"
	ELSE
	{
		TIMELINE_KILL(TIML_ID)
		CALL 'Debug'(AMX_INFO, 'Initialization is finished.')
	}
}
