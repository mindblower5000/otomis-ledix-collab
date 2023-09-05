MODULE_NAME='Otomis_LutronQSX_comm' (DEV dvHWI, DEV vdvHWI, DEV vdvDuetHWI, CHAR IPAddress[])
/*
	Homeworks QSX comm module
	-------------------------------
	Author : 	JA
	Version : 	1.1
	Date : 		2022-09-28
	
	Release notes:
	v1.1:	Ajout commande 'M:R:23' //Raise the shade with Integration ID 23
	
*/


/*
	Required in order to use string handling functions
*/

#INCLUDE '_utils'

DEFINE_CONSTANT

//Timeline DEFINE_PROGRAM
TIMELINE_DEFINE_PROGRAM_MODULES = 54080

DEFINE_VARIABLE

// AMX Module Com & Data
char Device_communicating 	= FALSE 
char Data_initialized  		= FALSE

//Timeline DEFINE_PROGRAM
CONSTANT LONG DEFINE_PROGRAM_TIMES[1] = {30000}

DEFINE_MODULE 'Lutron_HomeWorksQSX_Comm_dr1_0_0' 	comm		(vdvDuetHWI, dvHWI)

DEFINE_CALL 'Debug' (INTEGER logLevel, CHAR message[])
{
	SEND_STRING 0, "'Otomis_LutronQSX_comm - ', message"
}

/*
	Parses Lutron feedback
*/
DEFINE_FUNCTION FeedbackAnalysis (CHAR fdbk[])
{
	LOCAL_VAR CHAR IntegrationID[6], Action[20], Parametres[30]
	LOCAL_VAR CHAR str[300]
	LOCAL_VAR CHAR tab[10][50]

	str = fdbk

	// BUTTON PRESS STATUS
	IF (FIND_STRING(str,'KEYPADSYSTEMBUTTONSTATE-/button/',1))
	{
		remove_string(str,'KEYPADSYSTEMBUTTONSTATE-/button/',1)
		StringSplit(str, ',', tab)

		IntegrationID = tab[1]
		Action = tab[2]

		SWITCH (Action)
		{
			CASE 'PUSH':			Reception_HWI("'K:P:', IntegrationID")
			CASE 'RELEASE':			Reception_HWI("'K:R:', IntegrationID")
			CASE 'HOLD':			Reception_HWI("'K:H:', IntegrationID")
			CASE 'DOUBLE_CLICK':	Reception_HWI("'K:D:', IntegrationID")
		}
	}
	
	// LED STATUS
	ELSE IF (FIND_STRING(str,'KEYPADSYSTEMBUTTONSTATUS-/led/',1))
	{
		remove_string(str,'KEYPADSYSTEMBUTTONSTATUS-/led/',1)
		StringSplit(str, ',', tab)

		IntegrationID = tab[1]
		Parametres = tab[2]

		SWITCH (Parametres)
		{
			CASE 'ON':			Reception_HWI("'K:L:', IntegrationID, ':1'")
			CASE 'OFF':			Reception_HWI("'K:L:', IntegrationID, ':0'")
		}
	}
	
	// LOAD LEVEL DIMMED OR SWITCHED
	ELSE IF (FIND_STRING(str,'LIGHTSYSTEMLEVEL-DM:/zone/',1))
	{
		remove_string(str,'LIGHTSYSTEMLEVEL-DM:/zone/',1)
		StringSplit(str, ',', tab)

		IntegrationID = tab[1]
		Parametres = tab[2]

		Reception_HWI("'L:D:', IntegrationID, ':', itoa(atoi(Parametres)*100/255)")
	}
	
	// PAIRING
	ELSE IF (FIND_STRING(str,'LUTRON.PAIR.STATUS-',1))
	{
		remove_string(str,'LUTRON.PAIR.STATUS-',1)

		if(str = '') str = 'OK'
		Reception_HWI("'PAIRING:', str")
	}
}

/*
	Sends a string onto the VDV for feedback handling
*/
DEFINE_FUNCTION Reception_HWI (CHAR Recu[])
{
	SEND_STRING vdvHWI, Recu
}

DEFINE_START


DEFINE_EVENT

#WARN 'IF PAIRING NEED TO BE RESET, USE COMMAND LUTRON.PAIR.RESET <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
DATA_EVENT[vdvDuetHWI]
{
	ONLINE:
    {
		SEND_COMMAND vdvDuetHWI,"'PROPERTY-IP_Address,',IPAddress"
		SEND_COMMAND vdvDuetHWI,"'REINIT'"
    }
	
	COMMAND:
	{
		FeedbackAnalysis(DATA.TEXT)
	}
}
CHANNEL_EVENT[vdvDuetHWI,251]
{
	ON:		Device_communicating = TRUE
	OFF:
	{
		Device_communicating = FALSE
		Reception_HWI("'PAIRING:BAD'")
	}
}
CHANNEL_EVENT[vdvDuetHWI,252]
{
	ON:		Data_initialized = TRUE
	OFF:
	{
		Data_initialized = FALSE
		Reception_HWI("'PAIRING:BAD'")
	}
}

DATA_EVENT[vdvHWI]
{
	ONLINE:
	{
		WAIT 50  TIMELINE_CREATE(TIMELINE_DEFINE_PROGRAM_MODULES, DEFINE_PROGRAM_TIMES, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)
	}

	/*
		Parses the comm commands and sends to the Lutron processor the
		corresponding commands.

		The commands are case insensitive.
	*/
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
				/*Keypad action simulation

				Example :
				SEND_COMMAND vdvLutron, 'K:P:109' 	//Simulates a press on the button 109
				SEND_COMMAND vdvLutron, 'K:D:109' 	//Simulates a double press on the button 109
				SEND_COMMAND vdvLutron, 'K:L:118:1' //Turn on the led 118
				SEND_COMMAND vdvLutron, 'K:S:B:109' //Subscribe button 109
				SEND_COMMAND vdvLutron, 'K:S:L:118' //Subscribe led 118
				SEND_COMMAND vdvLutron, 'K:?:B:109' //Asked button 109
				SEND_COMMAND vdvLutron, 'K:?:L:118' //Asked led 118


				*/
				CASE 'K':
				{
					SWITCH (tab[2])
					{
						CASE 'P':		SEND_COMMAND vdvDuetHWI, "'KEYPADSYSTEMBUTTONSTATE-/button/',tab[3],',CLICK'"
						CASE 'R':		CALL 'Debug' (AMX_ERROR, "'K:R:XX UNLKOWN '")
						CASE 'H':		CALL 'Debug' (AMX_ERROR, "'K:H:XX UNLKOWN '")
						CASE 'D':		SEND_COMMAND vdvDuetHWI, "'KEYPADSYSTEMBUTTONSTATE-/button/',tab[3],',DOUBLE_CLICK'"
						CASE 'L':
						{
							SWITCH (tab[4])
							{
								CASE '0':	SEND_COMMAND vdvDuetHWI, "'KEYPADSYSTEMBUTTONSTATUS-/led/',tab[3],',OFF'"
								CASE '1':	SEND_COMMAND vdvDuetHWI, "'KEYPADSYSTEMBUTTONSTATUS-/led/',tab[3],',ON'"
								CASE '2':	SEND_COMMAND vdvDuetHWI, "'KEYPADSYSTEMBUTTONSTATUS-/led/',tab[3],',BLINK'"
								CASE '3':	SEND_COMMAND vdvDuetHWI, "'KEYPADSYSTEMBUTTONSTATUS-/led/',tab[3],',RAPIDBLINK'"
							}
						}
						CASE 'S':
						{
							SWITCH (tab[3])
							{
								CASE  'B':	SEND_COMMAND vdvDuetHWI, "'LUTRON.KEYPAD.BUTTON.SUBSCRIBE-/button/',tab[4]"
								CASE  'L':	SEND_COMMAND vdvDuetHWI, "'LUTRON.KEYPAD.LED.SUBSCRIBE-/led/',tab[4]"
							}
						}
						CASE '?':
						{
							SWITCH (tab[3])
							{
								CASE  'B':	SEND_COMMAND vdvDuetHWI, "'?KEYPADSYSTEMBUTTONSTATE-/button/',tab[4]"
								CASE  'L':	SEND_COMMAND vdvDuetHWI, "'?KEYPADSYSTEMBUTTONSTATUS-/led/',tab[4]"
							}
						}
					}
				}

				/*Sends a level value (0 - 100) to an output or requests its level

				Example :
				SEND_COMMAND vdvLutron, 'L:D:14:85' //Forces the load 14 to an output level of 85%
				SEND_COMMAND vdvLutron, 'L:D:14:?'  //Requests the level of the load 14
				SEND_COMMAND vdvLutron, 'L:D:14:S'  //Subscribe load 14
				
				SEND_COMMAND vdvLutron, 'L:S:14:1' //Forces the load 14 to on
				SEND_COMMAND vdvLutron, 'L:S:14:?'  //Requests the level of the load 14
				SEND_COMMAND vdvLutron, 'L:S:14:S'  //Subscribe load 14
				*/
				CASE 'L':
				{
					SWITCH (tab[2])
					{
						CASE 'D':
						{
							IF (tab[4] == '?')
								SEND_COMMAND vdvDuetHWI, "'?LIGHTSYSTEMLEVEL-DM:/zone/',tab[3]"								//Envoi_HWI("'?OUTPUT,', tab[2], ',', ACTION_ZONE_LEVEL")
							ELSE IF (tab[4] == 'S')
								SEND_COMMAND vdvDuetHWI, "'LUTRON.ZONE.LEVEL.SUBSCRIBE-DM:/zone/',tab[3]"
							ELSE
								SEND_COMMAND vdvDuetHWI, "'LIGHTSYSTEMLEVEL-DM:/zone/',tab[3],',',itoa(atoi(tab[4])*255/100)"
						}
						CASE 'S':
						{
							IF (tab[4] == '?')
								SEND_COMMAND vdvDuetHWI, "'?LIGHTSYSTEMLEVEL-SW:/zone/',tab[3]"								//Envoi_HWI("'?OUTPUT,', tab[2], ',', ACTION_ZONE_LEVEL")
							ELSE IF (tab[4] == 'S')
								SEND_COMMAND vdvDuetHWI, "'LUTRON.ZONE.LEVEL.SUBSCRIBE-SW:/zone/',tab[3]"
							ELSE
								SEND_COMMAND vdvDuetHWI, "'LIGHTSYSTEMLEVEL-SW:/zone/',tab[3],',',itoa(atoi(tab[4])*255/100)"
						}
					}
				}

				/*Shades control

				Example :
				SEND_COMMAND vdvLutron, 'S:R:23' //Raise the shade with Integration ID 23
				*/
				CASE 'S':
				{
					SWITCH (tab[2])
					{
						CASE 'L':	SEND_COMMAND vdvDuetHWI, "'LUTRON.SHADESYSTEM.RAMP-SH:/zone/',tab[3],',DOWN'"	//Envoi_HWI("'#OUTPUT,', tab[3], ',', ACTION_LOWER")
						CASE 'R':	SEND_COMMAND vdvDuetHWI, "'LUTRON.SHADESYSTEM.RAMP-SH:/zone/',tab[3],',UP'"		//Envoi_HWI("'#OUTPUT,', tab[3], ',', ACTION_RAISE")
						CASE 'S':	SEND_COMMAND vdvDuetHWI, "'LUTRON.SHADESYSTEM.RAMP-SH:/zone/',tab[3],',STOP'"	//Envoi_HWI("'#OUTPUT,', tab[3], ',', ACTION_STOP")
					}
				}

				/*Motor control

				Example :
				SEND_COMMAND vdvLutron, 'M:R:23' //Raise the shade with Integration ID 23
				*/
				CASE 'M':
				{
					SWITCH (tab[2])
					{
						CASE 'L':	SEND_COMMAND vdvDuetHWI, "'LUTRON.SHADESYSTEM.RAMP-MS:/zone/',tab[3],',DOWN'"	//Envoi_HWI("'#OUTPUT,', tab[3], ',', ACTION_LOWER")
						CASE 'R':	SEND_COMMAND vdvDuetHWI, "'LUTRON.SHADESYSTEM.RAMP-MS:/zone/',tab[3],',UP'"		//Envoi_HWI("'#OUTPUT,', tab[3], ',', ACTION_RAISE")
						CASE 'S':	SEND_COMMAND vdvDuetHWI, "'LUTRON.SHADESYSTEM.RAMP-MS:/zone/',tab[3],',STOP'"	//Envoi_HWI("'#OUTPUT,', tab[3], ',', ACTION_STOP")
					}
				}

				//Sends other strings to the Lutron processor !!!!!! NOT TESTED !!!!!! 
				CASE '>':
				{
					SEND_COMMAND vdvDuetHWI, "'PASSTHRU-',tab[2]"	// Envoi_HWI(tab[2])
				}
			}
		}
	}
}