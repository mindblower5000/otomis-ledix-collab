PROGRAM_NAME='Lutron_Custom_PC'
/*
	Homeworks QSX customization include
	----------------------------------
	Author : 	JA
	Version : 	1.0
	Date : 		2022-09-01
*/

/*
	Required in order to use string handling functions
*/
#INCLUDE '_utils'


DEFINE_CONSTANT

// CLASSIC  CONTROL NOT USED
LOAD_NB = 1
ROOM_NB = 1

/*
	Room indexes
	
	You can define here the indexes of each room. 
	It makes the load initialization more readable.
	
	Be careful, the indexes are CHAR[].
	You can only create 30 rooms.	
*/
//-----------------------------------------------------------------------------
// BUTTON ID ------------------------------------------------------------------
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// LED ID ---------------------------------------------------------------------
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// PHANTOM BUTTON ID ----------------------------------------------------------
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// ZONES ----------------------------------------------------------------------
//-----------------------------------------------------------------------------
/*
CHAMBRE			= '1'
SDB				= '2'
*/

DEFINE_VARIABLE

/*
	Main call used to declare the loads from the Lutron program 
	and the settings.
	
	Please refer to the command list in the workspace.	
*/
DEFINE_FUNCTION lutronInit(DEV vdvLutron)
{
	stack_var char num

/*	
	//Settings customization
	SEND_COMMAND vdvLutron, 'INIT:DEFAULT_ON:90'
	SEND_COMMAND vdvLutron, 'INIT:DEFAULT_DIM_STEP:5'
	
	//Indication of the load count and initialization of the load array
*/	SEND_COMMAND vdvLutron, "'INIT:LOAD_COUNT:', ITOA(LOAD_NB)"
	SEND_COMMAND vdvLutron, "'INIT:ROOM_COUNT:', ITOA(ROOM_NB)"
/*	SEND_COMMAND vdvLutron, 'INIT:START'
	
	//Room verbose name declaration
	SEND_COMMAND vdvLutron, "'INIT:ROOM_NAME:', CHAMBRE				,':', 'Chambre'"	
	SEND_COMMAND vdvLutron, "'INIT:ROOM_NAME:', SDB					,':', 'SdB'"	
	
	//Informations about each load			AMX ID       Full Name						Lutron ID   					Room	
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '61', ':', 'Zone',	':', 	'0000', ':', AUTRES/*,':NON_DIM'*/"
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '30', ':', 'Zone',	':', 	'0000', ':', AUTRES/*,':NON_DIM'*/"
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '29', ':', 'Zone',	':', 	'0000', ':', AUTRES/*,':NON_DIM'*/"
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '30', ':', 'Zone',	':', 	'0000', ':', AUTRES/*,':NON_DIM'*/"
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '29', ':', 'Zone',	':', 	'0000', ':', AUTRES/*,':NON_DIM'*/"
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '30', ':', 'Zone',	':', 	'0000', ':', AUTRES/*,':NON_DIM'*/"
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '29', ':', 'Zone',	':', 	'0000', ':', AUTRES/*,':NON_DIM'*/"
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '30', ':', 'Zone',	':', 	'0000', ':', AUTRES/*,':NON_DIM'*/"	

*/

	//List of Buttons which need to be tracked
//	SEND_COMMAND vdvLutron, "'K:S:B:',rooms[num].musiqueButtonID"


	//List of Leds which need to be tracked
	for(num=1;num<=EFFECTIVE_NB_ZONES;num++)
	{
		SEND_COMMAND vdvLutron, "'K:S:L:',zones[num].phantomLedID_ONOFF"
		SEND_COMMAND vdvLutron, "'K:S:L:',zones[num].phantomLedID_1"
		SEND_COMMAND vdvLutron, "'K:S:L:',zones[num].phantomLedID_2"
		SEND_COMMAND vdvLutron, "'K:S:L:',zones[num].phantomLedID_3"
		SEND_COMMAND vdvLutron, "'K:S:L:',zones[num].phantomLedID_4"
	}
	
	//List of Loads which need to be tracked
//	SEND_COMMAND vdvLutron,"'L:D:',rooms[num].DND_loadID,':S'"

	//Asking Lutron the actual levels of each declared load
	SEND_COMMAND vdvLutron, 'INIT:END'	
}

/*
	Call handling the keypad actions.
	
	It parses the strings coming from the comm module.
	You can customize here the double-tap actions, and so on.
*/
DEFINE_CALL 'keypadActionsParser'(CHAR vdvString[])
{
	STACK_VAR CHAR str[300]
	STACK_VAR CHAR tab[10][30]
	str = UPPER_STRING(vdvString)
	
	IF(FIND_STRING(str, 'K:', 1) == 1) 
	{
		StringSplit(str, ':', tab)
		
		SWITCH (tab[2])
		{
			CASE 'L':
			{
				SEND_STRING 0, "'LED#',tab[3],' is ',tab[4]"
				
				LedFeedbackAnalysis(tab[3],atoi(tab[4]))
			}				
			CASE 'P':
			{
				SEND_STRING 0, "'BUTTON#',tab[3],' click'"
				
				ButtonFeedbackAnalysis(tab[3],atoi(tab[4]))
			}			
			CASE 'R':
			{
				SEND_STRING 0, "'BUTTON#',tab[3],' realease'"
			}
			CASE 'H':
			{
				SEND_STRING 0, "'BUTTON#',tab[3],' hold'"
			}			
			CASE 'D':
			{
				SEND_STRING 0, "'BUTTON#',tab[3],' double_click'"
			}
		}
	}
}

DEFINE_FUNCTION LedFeedbackAnalysis (CHAR lutron_ID[], CHAR state)
{
	stack_var char num
	
	for(num=1;num<=EFFECTIVE_NB_ZONES;num++)
	{
		IF(lutron_ID == zones[num].phantomLedID_ONOFF)
		{
			zones[num].LEDFeedbackPhantom[1] = state
			
			if(num  <=  Z_10_SS_WC_Espace)
				UpdateViewState(Etage_SS)
			else if(num  <=  Z_18_R0_Palier_et)
				UpdateViewState(Etage_RDC)
			else if(num  <=  Z_25_R1_Pallier_P)
				UpdateViewState(Etage_R1)
			/*
			else if(num  <=  Z_10_SS_WC_Espace)
				UpdateViewState(Etage_R2)
			else if(num  <=  Z_10_SS_WC_Espace)
				UpdateViewState(Etage_R3)
			else if(num  <=  Z_10_SS_WC_Espace)
				UpdateViewState(Etage_R4)
			*/
			else if(num  <=  Z_27_R5_Pigeonnie)
				UpdateViewState(Etage_R5)
			
			break
		}
		ELSE IF(lutron_ID == zones[num].phantomLedID_1)
		{
			IF((zones[num].LEDFeedbackPhantom[2] == 0 ) && (state == 1))
				zones[num].LightSceneLevel = 50
			
			zones[num].LEDFeedbackPhantom[2] = state
			break
		}
		ELSE IF(lutron_ID == zones[num].phantomLedID_2)
		{
			IF((zones[num].LEDFeedbackPhantom[3] == 0 ) && (state == 1))
				zones[num].LightSceneLevel = 50
			
			zones[num].LEDFeedbackPhantom[3] = state
			break
		}
		ELSE IF(lutron_ID == zones[num].phantomLedID_3)
		{
			IF((zones[num].LEDFeedbackPhantom[4] == 0 ) && (state == 1))
				zones[num].LightSceneLevel = 50
			
			zones[num].LEDFeedbackPhantom[4] = state
			break
		}
		ELSE IF(lutron_ID == zones[num].phantomLedID_4)
		{
			IF((zones[num].LEDFeedbackPhantom[5] == 0 ) && (state == 1))
				zones[num].LightSceneLevel = 50
			
			zones[num].LEDFeedbackPhantom[5] = state
			break
		}
	}
}
DEFINE_FUNCTION ButtonFeedbackAnalysis (CHAR lutron_ID[], CHAR state)
{
/*
	NOT USED
*/
}
DEFINE_FUNCTION UpdateRoomLightBargraph(DEV dvTP)
{	
	STACK_VAR INTEGER zone_id_to_show
	
    zone_id_to_show = 0
    zone_id_to_show = GetZoneIdByName(lastZoneSelectedInTP[GetDevIndex(dvTP)])
    
	IF(zones[zone_id_to_show].LEDFeedbackPhantom[1] == 0)
		SEND_COMMAND dvTP, "'^SHO-',itoa(l_ad_SceneLevel),',0'"
	ELSE IF((zones[zone_id_to_show].LEDFeedbackPhantom[2] == 0 ) && 
			(zones[zone_id_to_show].LEDFeedbackPhantom[3] == 0 ) && 
			(zones[zone_id_to_show].LEDFeedbackPhantom[4] == 0 ) && 
			(zones[zone_id_to_show].LEDFeedbackPhantom[5] == 0 ))
		SEND_COMMAND dvTP, "'^SHO-',itoa(l_ad_SceneLevel),',0'"
	ELSE
	{
		SEND_COMMAND dvTP, "'^SHO-',itoa(l_ad_SceneLevel),',1'"
		SEND_LEVEL dvTP, l_l_SceneLevel, zones[zone_id_to_show].LightSceneLevel
	}
}	
DEFINE_FUNCTION syncLightInAllDevices()
{
    LOCAL_VAR INTEGER zone_id_to_show[EFFECTIVE_TP_NB]
    STACK_VAR INTEGER cx

    #WARN 'ONLY 1st device is under sync... Put TP NB instead 1'
    FOR(cx = 1; cx<=1 ;cx++)	//temp EFFECTIVE_TP_NB
    {

	IF(lastZoneSelectedInTP[cx])
	{
		zone_id_to_show[cx] = 0
		zone_id_to_show[cx] = GetZoneIdByName(lastZoneSelectedInTP[cx])
		
		//debug(AMX_DEBUG, "'RoomUpdateMenuState :: Zone ', ZONELIST[zone_id_to_show[cx]], ' SRC:',ZoneSourceSelected[zone_id_to_show[cx]]")
		
		//Building the state according to the selected source
		
		[TPTabPC[cx], l_ch_Light[3]] = (zones[zone_id_to_show[cx]].LEDFeedbackPhantom[ 1])
		[TPTabPC[cx], l_ch_Light[4]] = (zones[zone_id_to_show[cx]].LEDFeedbackPhantom[ 2])
		[TPTabPC[cx], l_ch_Light[5]] = (zones[zone_id_to_show[cx]].LEDFeedbackPhantom[ 3])
		[TPTabPC[cx], l_ch_Light[6]] = (zones[zone_id_to_show[cx]].LEDFeedbackPhantom[ 4])
		[TPTabPC[cx], l_ch_Light[7]] = (zones[zone_id_to_show[cx]].LEDFeedbackPhantom[ 5])
	}
	}
}
DEFINE_FUNCTION lightScenario(DEV dvTP, CHAR zone[], CHAR lightScenarioName[]) 	// NOT USED
{
/*    SWITCH (zone)
    {	
//-----------------------------------------------------------------------------
// Global ---------------------------------------------------------------------
//-----------------------------------------------------------------------------
		CASE 'Global':
		{
			SWITCH (lightScenarioName)
			{
				CASE 'Full':
				{
/*							DO_PUSH(dvTP_LS_Master,l_ch_RoomCommands[(4*(atoi(SALON) 		- 1))	+ 1])
					wait 1	DO_PUSH(dvTP_LS_Master,l_ch_RoomCommands[(4*(atoi(SAM) 			- 1))	+ 1])
*/
				}
				CASE 'Medium':
				{
/*							DO_PUSH(dvTP_LS_Master,l_ch_RoomCommands[(4*(atoi(SALON) 		- 1))	+ 2])
					wait 1	DO_PUSH(dvTP_LS_Master,l_ch_RoomCommands[(4*(atoi(SAM) 			- 1))	+ 2])
*/				}
				CASE 'Soft':
				{
/*							DO_PUSH(dvTP_LS_Master,l_ch_RoomCommands[(4*(atoi(SALON) 		- 1))	+ 3])
					wait 1	DO_PUSH(dvTP_LS_Master,l_ch_RoomCommands[(4*(atoi(SAM) 			- 1))	+ 3])
*/				}
				CASE 'Off':
				{
/*							DO_PUSH(dvTP_LS_Master,l_ch_RoomCommands[(4*(atoi(SALON) 		- 1))	+ 4])
					wait 1	DO_PUSH(dvTP_LS_Master,l_ch_RoomCommands[(4*(atoi(SAM) 			- 1))	+ 4])
*/				}
			}
		}
	} 
*/	
}


/*
	Shade actions customization
*/
DEFINE_FUNCTION shade(DEV dvTP, CHAR zone[], CHAR shadeName[], CHAR action[])
{
/*
	LOCAL_VAR CHAR tab[4][10]
	STACK_VAR CHAR _actionToSend, num
	STACK_VAR CHAR _upAction[10]

	num = TPNumber(dvTP)
	
	//Action parsing
	_upAction = UPPER_STRING(action)
	
	IF (!(_upAction == 'R' || _upAction == 'L' || _upAction == 'S'))
	{
		SWITCH (_upAction)
		{
			CASE 'OPEN':
			CASE 'OUVRIR':
			CASE 'RAISE':
			{
				_actionToSend = 'R'
			}
			
			CASE 'CLOSE':
			CASE 'FERMER':
			CASE 'LOWER':
			{
				_actionToSend = 'L'
			}
			
			CASE 'STOP':
			CASE 'ARRET':
			{
				_actionToSend = 'S'
			}

			CASE 'P1':
			CASE 'P2':
			{
				_actionToSend = _upAction[2]
			}				
		}
	}
	ELSE 
		_actionToSend = _upAction[1]
	
	SWITCH (zone)
	{
//-----------------------------------------------------------------------------
// BEDROOM --------------------------------------------------------------------
//-----------------------------------------------------------------------------
		CASE 'Bedroom':
		{
			SWITCH (shadeName)
			{
				CASE 'Shades':
				{
					SWITCH (_actionToSend)
					{
						CASE 'R': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedShadesOpenID"
						CASE 'S': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedShadesStopID"
						CASE 'L': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedShadesCloseID"
					}
				}				
				CASE 'Blackout':
				{
					SWITCH (_actionToSend)
					{
						CASE 'R': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedBlackoutOpenID"
						CASE 'S': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedBlackoutStopID"
						CASE 'L': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedBlackoutCloseID"
					}
				}
			}
		}		
	}	
*/
}
	
DEFINE_EVENT
/*
	Touch panels string parsing
*/
DATA_EVENT[TPTabPC]						
{
	ONLINE: 
	{
		
	}
	STRING:
	{		
		LOCAL_VAR CHAR str[100]
		LOCAL_VAR CHAR tab[4][45]
		str = DATA.TEXT
		
		StringSplit(str, '@', tab)
		
		SWITCH (tab[1])
		{
			CASE 'LIG':	//Lighting (Layout : "LIG@Living@Cosy") 
			{
				lightScenario(DATA.DEVICE, tab[2], tab[3])
			}
			
			CASE 'SHA': //Shades (Layout : "SHA@Living@Left Shade@Open")
			{
				shade(DATA.DEVICE, tab[2], tab[3], tab[4])
			}
		}
	}
}

/*
	Lutron virtual device string parsing
*/
DATA_EVENT[vdvLutron]
{
	ONLINE:
	{
	}
	STRING:
	{
		CALL 'keypadActionsParser' (DATA.TEXT)
	}
}

BUTTON_EVENT[TPTabPC, l_ch_Light]
{
	PUSH:
	{
		LOCAL_VAR INTEGER zone_id_to_show
		stack_var char cmd
		
		cmd = GET_LAST(l_ch_Light)
		
		zone_id_to_show = GetZoneIdByName(lastZoneSelectedInTP[GET_LAST(TPTabPC)])
		
		SWITCH (cmd)
		{
			CASE  1: SEND_COMMAND vdvLutron, "'K:P:',zones[zone_id_to_show].phantomButtonAllID_ON"	// ALL ON
			CASE  2: SEND_COMMAND vdvLutron, "'K:P:',zones[zone_id_to_show].phantomButtonAllID_OFF"	// ALL OFF
			CASE  3: SEND_COMMAND vdvLutron, "'K:P:',zones[zone_id_to_show].phantomButtonID_ONOFF"	// ON/OFF
			CASE  4: SEND_COMMAND vdvLutron, "'K:P:',zones[zone_id_to_show].phantomButtonID_1"		// Scene#1
			CASE  5: SEND_COMMAND vdvLutron, "'K:P:',zones[zone_id_to_show].phantomButtonID_2"		// Scene#2
			CASE  6: SEND_COMMAND vdvLutron, "'K:P:',zones[zone_id_to_show].phantomButtonID_3"		// Scene#3
			CASE  7: SEND_COMMAND vdvLutron, "'K:P:',zones[zone_id_to_show].phantomButtonID_4"		// Scene#4
			CASE  8: SEND_COMMAND vdvLutron, "'K:P:',zones[zone_id_to_show].phantomButtonID_Raise"	// Raise
			CASE  9: SEND_COMMAND vdvLutron, "'K:P:',zones[zone_id_to_show].phantomButtonID_Lower"	// Lower
		}
		
		SWITCH (cmd)
		{
			CASE  1: // ALL ON
			CASE  2: // ALL OFF
			{
				SEND_COMMAND BUTTON.INPUT.DEVICE, "'^SHO-',itoa(l_ad_SceneLevel),',0'"
			}
			
			CASE  3: // ON/OFF
				SEND_COMMAND BUTTON.INPUT.DEVICE, "'^SHO-',itoa(l_ad_SceneLevel),',0'"

			CASE  4: // Scene#1
			CASE  5: // Scene#2
			CASE  6: // Scene#3
			CASE  7: // Scene#4
			{
				zones[zone_id_to_show].LightSceneLevel = 50
				SEND_COMMAND BUTTON.INPUT.DEVICE, "'^SHO-',itoa(l_ad_SceneLevel),',1'"
				SEND_LEVEL BUTTON.INPUT.DEVICE, l_l_SceneLevel, zones[zone_id_to_show].LightSceneLevel
			}
				
			CASE  8: // Raise
			{
				IF(zones[zone_id_to_show].LightSceneLevel < 96)
				{
					zones[zone_id_to_show].LightSceneLevel = zones[zone_id_to_show].LightSceneLevel + 5
					SEND_LEVEL BUTTON.INPUT.DEVICE, l_l_SceneLevel, zones[zone_id_to_show].LightSceneLevel
				}
			}
			
			CASE  9: // Lower
			{
				IF(zones[zone_id_to_show].LightSceneLevel > 4)
				{
					zones[zone_id_to_show].LightSceneLevel = zones[zone_id_to_show].LightSceneLevel - 5
					SEND_LEVEL BUTTON.INPUT.DEVICE, l_l_SceneLevel, zones[zone_id_to_show].LightSceneLevel
				}
			}
		}
	}
}

TIMELINE_EVENT[TIMELINE_DEFINE_PROGRAM_LUTRON_CUSTOM]
{
    syncLightInAllDevices()
}

