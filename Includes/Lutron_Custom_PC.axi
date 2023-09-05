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
CHAMBRE			= '1'
SDB				= '2'

DEFINE_VARIABLE


/*
	Main call used to declare the loads from the Lutron program 
	and the settings.
	
	Please refer to the command list in the workspace.	
*/
DEFINE_FUNCTION lutronInit(DEV vdvLutron)
{
	stack_var char num
	
	//Settings customization
	SEND_COMMAND vdvLutron, 'INIT:DEFAULT_ON:90'
	SEND_COMMAND vdvLutron, 'INIT:DEFAULT_DIM_STEP:5'
	
	//Indication of the load count and initialization of the load array
	SEND_COMMAND vdvLutron, "'INIT:LOAD_COUNT:', ITOA(LOAD_NB)"
	SEND_COMMAND vdvLutron, "'INIT:ROOM_COUNT:', ITOA(ROOM_NB)"
	SEND_COMMAND vdvLutron, 'INIT:START'
	
	
	//Room verbose name declaration
	SEND_COMMAND vdvLutron, "'INIT:ROOM_NAME:', CHAMBRE				,':', 'Chambre'"	
	SEND_COMMAND vdvLutron, "'INIT:ROOM_NAME:', SDB					,':', 'SdB'"	
	
	// TODO ALL ROOMS!!!!
	//Informations about each load			AMX ID       Full Name						Lutron ID   					Room	
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '1', ':',  'DND_301',				':', 	'1', ':', 	CHAMBRE,':NON_DIM'"
	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '2', ':',  'MUMR_301',				':', 	'2', ':', 	CHAMBRE,':NON_DIM'"
	
//	SEND_COMMAND vdvLutron, "'INIT:LOAD:', '2', ':',  'MUMR_301',					':', 	'21574', ':', 		CHAMBRE/*,':NON_DIM'*/"

/*	
SEE TIMECLOCKS INCLUDE FOR
R+4\Salle de bain ch invité TD C\Seche servite /zone/8255
R+5\Salle de bain master\Seche serviette /zone/8236
R+5\Hammam\Seche serviette /zone/8246


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
	//SEND_COMMAND vdvLutron, "'K:S:B:',BUTTON_VELUX_WC"
	// TODO ONLY ROOM#301 (#5)
/*	num = 5
	for(num=1;num<=NB_ROOMS;num++)
	{
		SEND_COMMAND vdvLutron, "'K:S:B:',rooms[num].musiqueButtonID"
//	}

	//List of Leds which need to be tracked
	// TODO ONLY ROOM#301 (#5)
	num = 5
	for(num=1;num<=NB_ROOMS;num++)
	{
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBedID_ONOFF"
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBedID_1"
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBedID_2"
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBedID_3"
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBedID_4"
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBathID_ONOFF"
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBathID_1"
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBathID_2"
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBathID_3"
		SEND_COMMAND vdvLutron, "'K:S:L:',rooms[num].phantomLedBathID_4"
//	}
	
	num = 5
	for(num=1;num<=NB_ROOMS;num++)
	{
		SEND_COMMAND vdvLutron,"'L:D:',rooms[num].DND_loadID,':S'"
		SEND_COMMAND vdvLutron,"'L:D:',rooms[num].MUMR_loadID,':S'"
//	}
*/	
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
	
/*
	for(num=1;num<=NB_ROOMS;num++)
	{
		IF(lutron_ID == rooms[num].phantomLedBedID_ONOFF)
		{
			rooms[num].LEDFeedbackPhantom[1] = state
			Refresh_Light_Page(num)
			break
		}
		ELSE IF(lutron_ID == rooms[num].phantomLedBedID_1)
		{
			rooms[num].LEDFeedbackPhantom[2] = state
			Refresh_Light_Page(num)
			break
		}
		ELSE IF(lutron_ID == rooms[num].phantomLedBedID_2)
		{
			rooms[num].LEDFeedbackPhantom[3] = state
			Refresh_Light_Page(num)
			break
		}
		ELSE IF(lutron_ID == rooms[num].phantomLedBedID_3)
		{
			rooms[num].LEDFeedbackPhantom[4] = state
			Refresh_Light_Page(num)
			break
		}
		ELSE IF(lutron_ID == rooms[num].phantomLedBedID_4)
		{
			rooms[num].LEDFeedbackPhantom[5] = state
			Refresh_Light_Page(num)
			break
		}
		ELSE IF(lutron_ID == rooms[num].phantomLedBathID_ONOFF)
		{
			rooms[num].LEDFeedbackPhantom[6] = state
			Refresh_Light_Page(num)
			break
		}
		ELSE IF(lutron_ID == rooms[num].phantomLedBathID_1)
		{
			rooms[num].LEDFeedbackPhantom[7] = state
			Refresh_Light_Page(num)
			break
		}
		ELSE IF(lutron_ID == rooms[num].phantomLedBathID_2)
		{
			rooms[num].LEDFeedbackPhantom[8] = state
			Refresh_Light_Page(num)
			break
		}
		ELSE IF(lutron_ID == rooms[num].phantomLedBathID_3)
		{
			rooms[num].LEDFeedbackPhantom[9] = state
			Refresh_Light_Page(num)
			break
		}
		ELSE IF(lutron_ID == rooms[num].phantomLedBathID_4)
		{
			rooms[num].LEDFeedbackPhantom[10] = state
			Refresh_Light_Page(num)
			break
		}
	}
*/
}
DEFINE_FUNCTION ButtonFeedbackAnalysis (CHAR lutron_ID[], CHAR state)
{
	stack_var char num
	
/*
	for(num=1;num<=NB_ROOMS;num++)
	{
		IF(lutron_ID == rooms[num].musiqueButtonID)
		{
			IF(rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off')
			{
				DO_PUSH(a_TPTab[num],a_ch_AudioPwr[BATHROOM])
			}
			ELSE
			{
				IF(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
				{
					DO_PUSH(a_TPTab[num],a_ch_AudioLink)
				}
				ELSE
				{
					DO_PUSH(a_TPTab[num],a_ch_AudioSrc[13])		// Player#1
				}
			}
				
			break
		}
	}
*/
}
DEFINE_FUNCTION Refresh_Light_Page(CHAR num)
{
/*
	[ls_TPTab[num], l_ch_Light[3]] = (rooms[num].LEDFeedbackPhantom[ 1])
	[ls_TPTab[num], l_ch_Light[4]] = (rooms[num].LEDFeedbackPhantom[ 2])
	[ls_TPTab[num], l_ch_Light[5]] = (rooms[num].LEDFeedbackPhantom[ 3])
	[ls_TPTab[num], l_ch_Light[6]] = (rooms[num].LEDFeedbackPhantom[ 4])
	[ls_TPTab[num], l_ch_Light[7]] = (rooms[num].LEDFeedbackPhantom [5])
                                                                     
	[ls_TPTab[num], l_ch_Light[10]] = (rooms[num].LEDFeedbackPhantom[ 6])
	[ls_TPTab[num], l_ch_Light[11]] = (rooms[num].LEDFeedbackPhantom[ 7])
	[ls_TPTab[num], l_ch_Light[12]] = (rooms[num].LEDFeedbackPhantom[ 8])
	[ls_TPTab[num], l_ch_Light[13]] = (rooms[num].LEDFeedbackPhantom[ 9])
	[ls_TPTab[num], l_ch_Light[14]] = (rooms[num].LEDFeedbackPhantom[10])
*/
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
//-----------------------------------------------------------------------------
// BATHROOM -------------------------------------------------------------------
//-----------------------------------------------------------------------------
		CASE 'Bathroom':
		{
			SWITCH (shadeName)
			{
				CASE 'Shades':
				{
					SWITCH (_actionToSend)
					{
						CASE 'R': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathShadesOpenID"
						CASE 'S': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathShadesStopID"
						CASE 'L': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathShadesCloseID"
					}
				}				
				CASE 'Blackout':
				{
					SWITCH (_actionToSend)
					{
						CASE 'R': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathBlackoutOpenID"
						CASE 'S': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathBlackoutStopID"
						CASE 'L': SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathBlackoutCloseID"
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

/*
BUTTON_EVENT[ls_TPTab, l_ch_Light]
{
	PUSH:
	{
		LOCAL_VAR char num
		stack_var char cmd
		
		num = GET_LAST(ls_TPTab)
		cmd = GET_LAST(l_ch_Light)
		
		SWITCH (cmd)
		{
/*			CASE  1: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonAllID_ON"		// ALL ON
			CASE  2: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonAllID_OFF"		// ALL OFF
			CASE  3: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedID_ONOFF"	// ON/OFF	BEDROOM
			CASE  4: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedID_1"		// Scene#1
			CASE  5: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedID_2"		// Scene#2
			CASE  6: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedID_3"		// Scene#3
			CASE  7: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedID_4"		// Scene#4
			CASE  8: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedID_Raise"	// Raise
			CASE  9: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedID_Lower"	// Lower
			CASE 10: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathID_ONOFF"	// ON/OFF	BATHROOM
			CASE 11: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathID_1"		// Scene#1
			CASE 12: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathID_2"		// Scene#2
			CASE 13: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathID_3"		// Scene#3
			CASE 14: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathID_4"		// Scene#4
			CASE 15: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathID_Raise"	// Raise
			CASE 16: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathID_Lower"	// Lower
*/		}
	}
	
	HOLD[3,REPEAT]:
	{
		LOCAL_VAR char num
		stack_var char cmd
		
		num = GET_LAST(ls_TPTab)
		cmd = GET_LAST(l_ch_Light)
		
		SWITCH (cmd)
		{
/*			CASE  8: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedID_Raise"	// Raise
			CASE  9: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBedID_Lower"	// Lower
			CASE 15: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathID_Raise"	// Raise
			CASE 16: SEND_COMMAND vdvLutron, "'K:P:',rooms[num].phantomButtonBathID_Lower"	// Lower
*/		}
	}
}
BUTTON_EVENT[i_TPTab, i_ch_Service]
{
	PUSH:
	{
		LOCAL_VAR char num
		stack_var char cmd
		
		num = GET_LAST(i_TPTab)
		cmd = GET_LAST(i_ch_Service)
		
		SWITCH (cmd)
		{
			CASE  1:
			{
				IF(rooms[num].dndEnabled)
				{
					SEND_COMMAND vdvLutron, "'L:S:',rooms[num].DND_loadID,':0'"
					rooms[num].dndEnabled = FALSE
				}
				ELSE
				{
					SEND_COMMAND vdvLutron, "'L:S:',rooms[num].DND_loadID,':100'"
					rooms[num].dndEnabled = TRUE

					SEND_COMMAND vdvLutron, "'L:S:',rooms[num].MUMR_loadID,':0'"
					rooms[num].mumrEnabled = FALSE
				}				
			}
			CASE  2:
			{
				
				IF(rooms[num].mumrEnabled)
				{
					SEND_COMMAND vdvLutron, "'L:S:',rooms[num].MUMR_loadID,':0'"
					rooms[num].mumrEnabled = FALSE
				}
				ELSE
				{
					SEND_COMMAND vdvLutron, "'L:S:',rooms[num].MUMR_loadID,':100'"
					rooms[num].mumrEnabled = TRUE
					
					SEND_COMMAND vdvLutron, "'L:S:',rooms[num].DND_loadID,':0'"
					rooms[num].dndEnabled = FALSE
				}
			}
		}
	}
}
*/

TIMELINE_EVENT[TIMELINE_DEFINE_PROGRAM_LUTRON_CUSTOM]
{

}

