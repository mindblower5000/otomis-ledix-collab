MODULE_NAME='Otomis_iPad' (DEV dvTP, CHAR isOnline, INTEGER NB_ZONES, CHAR zoneList[][], CHAR lastZoneSelected[], CHAR lastActivitySelected[], CHAR zonesPopup[], CHAR FHCActPopup[], CHAR UILanguage[2], LONG timer)


///////////////////////////////////////////////////////////////////////////////
/*    Boradcast message support	addded by AM				     */
/*    Language support modifications 20190731 				     */
/* 	movie button added 						     */
///////////////////////////////////////////////////////////////////////////////



#INCLUDE 'UnicodeLib'
#INCLUDE '_utils2'


DEFINE_DEVICE
vdvBridge = 36002:1:1;	//Broadcast device


DEFINE_CONSTANT

TIMELINE_DEFINE_PROGRAM_MODULES = 54080

MAX_ZONES_NB = 40
MAX_ACTIVITIES_NB = 20
 

//-----------------------------------------------------------------------------
// Channel codes ---------------------------------------------------------------
//-----------------------------------------------------------------------------
I_C_TOP_BAS = 4

//-----------------------------------------------------------------------------
// Adress codes ---------------------------------------------------------------
//-----------------------------------------------------------------------------
I_A_ZONE_NAME = 1
I_A_ACTIVITY_NAME = 2
I_A_CLOCK = 3
I_A_TOP_BAS = 4
I_A_BACKGROUND = 6
I_A_AV_TOP = 201
I_A_AV_PARTY = 221
I_A_AV_MOVIE = 222

DEFINE_VARIABLE

CONSTANT LONG DEFINE_PROGRAM_TIMES[1] = {60000}

//-----------------------------------------------------------------------------
// Channel codes --------------------------------------------------------------
//-----------------------------------------------------------------------------

//Interface
CONSTANT INTEGER i_ch_Activities[MAX_ACTIVITIES_NB]		= {101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120}
CONSTANT INTEGER i_ch_Zones[MAX_ZONES_NB]			= {51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90}

#INCLUDE '_utils'

DEFINE_MUTUALLY_EXCLUSIVE

//-----------------------------------------------------------------------------
// Selected zone --------------------------------------------------------------
//-----------------------------------------------------------------------------
([dvTP,	i_ch_Zones[1]]..[dvTP, i_ch_Zones[MAX_ZONES_NB]])

//-----------------------------------------------------------------------------
// Selected menu src  --------------------------------------------------------------
//-----------------------------------------------------------------------------

#WARN 'Mutually Hardcoded in iPad module for Audio & Video Source Selected '
([dvTP,	141]..[dvTP, 147],[dvTP, 181])
([dvTP,	148]..[dvTP, 160],[dvTP, 182])
([dvTP,	161]..[dvTP, 170],[dvTP, 183])
([dvTP,	171]..[dvTP, 180],[dvTP, 184])


//-----------------------------------------------------------------------------
// Selected activity ----------------------------------------------------------
//-----------------------------------------------------------------------------
([dvTP, i_ch_Activities[ 1]]..[dvTP, i_ch_Activities[ 6]])	//V A L AC SH EXP			
//([dvTP, i_ch_Activities[11]]..[dvTP, i_ch_Activities[MAX_ACTIVITIES_NB-1]])			//My home / Chez moi


DEFINE_FUNCTION RefreshTime()
{
	SEND_COMMAND dvTP,	"'^TXT-', ITOA(I_A_CLOCK),',0,', LEFT_STRING(TIME, 5)"
}

DEFINE_CALL 'Debug' (INTEGER logLevel, CHAR str[])
{
	AMX_LOG(logLevel, "'iPad::',DEVICE_ID_STRING(dvTP),'::', str")
}

DEFINE_FUNCTION INTEGER getZoneID (CHAR zoneName[])
{
	LOCAL_VAR i
	FOR (i=1;i<=NB_ZONES;i++)
	{
		IF (zoneList[i] == zoneName)
			RETURN i
	}
	RETURN 0
}

DEFINE_CALL 'sendUnicodeString' (INTEGER adCode, WIDECHAR value[30])
{
	SEND_COMMAND dvTP, "'^UNI-', ITOA(adCode), ',0,', WC_TP_ENCODE(value)"
}

DEFINE_FUNCTION EXECUTE_STRING(DEV _DEV, CHAR str[])
{
	LOCAL_VAR CHAR tab[4][45]
	
	IF (LEFT_STRING(str, 7) == 'Profile') //BYOD Handling
	{}
	ELSE
	{
		StringSplit(str, '@', tab)
		
		SWITCH (tab[1])
		{
			CASE 'DEV':
			{
				IF (tab[2] == 'Startup')
				{
					SEND_COMMAND dvTP, '@PPX'
					SEND_COMMAND dvTP, "'^PGE-', zonesPopup"
					//SEND_STRING 0, "'^PGE-', zonesPopup"
					//SEND_COMMAND dvTP, 'PAGE-Background'		
					//SEND_COMMAND dvTP, "'@PPN-', zonesPopup"
					//SEND_COMMAND dvTP, "'@PPN-', FHCActPopup"
					//SEND_COMMAND dvTP, '@PPN-z_helpZones'
					
					//Delete actions
					SEND_COMMAND dvTP, "'^DPF-', ITOA(i_ch_Zones[1]), ',Show'" //Delete show popup actions
					
					//Add page flip actions
					SEND_COMMAND dvTP, "'@PPN-', ITOA(i_ch_Zones[1]), ',Show,', FHCActPopup"
					SEND_COMMAND dvTP, "'^APF-', ITOA(i_ch_Zones[1]), ',Show,', FHCActPopup" 
					
					SWITCH (UILanguage)
					{
						CASE 'fr': 	SEND_COMMAND dvTP, "'^APF-', ITOA(i_ch_Zones[1]), ',Show,', 'z_helpFHC'"
						CASE 'en': 	SEND_COMMAND dvTP, "'^APF-', ITOA(i_ch_Zones[1]), ',Show,', 'z_helpFHC'"
						CASE 'ru': 	SEND_COMMAND dvTP, "'^APF-', ITOA(i_ch_Zones[1]), ',Show,', 'z_helpFHCR'"
					}
					
					 
					
					SEND_COMMAND dvTP, 'TPCCMD-QueryProfile'
					WAIT 100 SEND_COMMAND dvTP, 'TPCCMD-QueryProfile'
				}
				ELSE IF (tab[2] == 'Zones')
				{
					//SEND_COMMAND dvTP, "'@PPN-', zonesPopup"
					WAIT 50 SEND_COMMAND dvTP, 'TPCCMD-QueryProfile'
					WAIT 60 SEND_COMMAND dvTP, 'TPCCMD-ApplyProfile'
					//SEND_COMMAND dvTP, 'PAGE-Z0'
					SEND_COMMAND dvTP, "'@PPN-', zonesPopup"
					SEND_COMMAND dvTP, "'@PPN-', ITOA(i_ch_Zones[1]), ',Show,', FHCActPopup"
					SEND_COMMAND dvTP, "'@PPN-', FHCActPopup"
					
					
					SWITCH (UILanguage)
					{
						CASE 'fr': 	SEND_COMMAND dvTP, "'^APF-', ITOA(i_ch_Zones[1]), ',Show,', 'z_helpFHC'"
						CASE 'en': 	SEND_COMMAND dvTP, "'^APF-', ITOA(i_ch_Zones[1]), ',Show,', 'z_helpFHC'"
						CASE 'ru': 	SEND_COMMAND dvTP, "'^APF-', ITOA(i_ch_Zones[1]), ',Show,', 'z_helpFHCR'"
					}					
					
				}
			}
			
			
			CASE 'ZON':	//Zone tracking
			{
				lastZoneSelected = tab[2]
			}
			
			CASE 'ACT':	//Activity tracking
			{
				lastActivitySelected = tab[2]
				
				SWITCH(lastActivitySelected)
				{
				    CASE 'Video':	WAIT 2 DO_PUSH(dvTP, i_ch_Activities[1])
				    CASE 'Audio':	WAIT 2 DO_PUSH(dvTP, i_ch_Activities[2])
				    CASE 'Light':	WAIT 2 DO_PUSH(dvTP, i_ch_Activities[3])
				    CASE 'HVAC': 	WAIT 2 DO_PUSH(dvTP, i_ch_Activities[4])
				    CASE 'Shades': 	WAIT 2 DO_PUSH(dvTP, i_ch_Activities[5])
				    CASE 'Exp': 	WAIT 2 DO_PUSH(dvTP, i_ch_Activities[6])
				}
			}
			
			CASE 'AUD':	//Display audio & video info
			CASE 'VID':
			{
				IF (tab[3] <> 'Party')
					SEND_COMMAND dvTP, "'^TXT-', ITOA(I_A_AV_TOP), ',0,', tab[3]"
			}
			
			CASE 'CLR':
			    CANCEL_WAIT 'HOLD_ON'
			    WAIT 10 'HOLD_ON'  
			    {	//RELEASE LOCK 
				timer = 0
				SEND_STRING 0,'iPad::CLEAR HOLD TIME !!!'
			    }
		}
	}

}


DEFINE_EVENT

DATA_EVENT [vdvBridge]
{
    STRING:
    {
		LOCAL_VAR CHAR tab[5][45]  
		
	
		StringSplit(DATA.TEXT, '=', tab)
		
		IF(tab[1]=='CAST')
		{
		    STACK_VAR DEV _DEV
		    
		    STRING_TO_DEV(tab[2],_DEV)
		    
			IF(_DEV==dvTP){
			CALL 'Debug' (AMX_DEBUG,"'ACTUATING BROADCAST MESSAGE FOR ',tab[2],':',tab[3]")
			EXECUTE_STRING(_DEV, "tab[3]")			
		    }
		    
		}
    }
}



DATA_EVENT[dvTP]							
{
	ONLINE:
	{
		isOnline = TRUE
		SEND_COMMAND vdvBridge,"'TPC@',ITOA(DATA.DEVICE.NUMBER),'@Online'"
		
		RefreshTime()
		
		WAIT 50  TIMELINE_CREATE(TIMELINE_DEFINE_PROGRAM_MODULES, DEFINE_PROGRAM_TIMES, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)	
		
		SEND_COMMAND dvTP, 'TPCCMD-QueryProfile'
		WAIT 100 SEND_COMMAND dvTP, 'TPCCMD-QueryProfile'
	}
	
	OFFLINE:
	{
		isOnline = FALSE
		SEND_COMMAND vdvBridge,"'TPC@',ITOA(DATA.DEVICE.NUMBER),'@Offline'"
		
		WAIT 20  TIMELINE_KILL(TIMELINE_DEFINE_PROGRAM_MODULES)	
	}
	
	STRING:
	{
		EXECUTE_STRING(DATA.DEVICE,DATA.TEXT);
	}
}

/*
BUTTON_EVENT[dvTP, i_ch_Zones]
{
	PUSH:
	{
		ON[dvTP, BUTTON.INPUT.CHANNEL]
		OFF[dvTP, i_ch_Activities]
		
		/*IF (GET_LAST(i_ch_Zones) == 1)	//My home / Chez moi
			ON[dvTP, i_ch_Activities[11]]*/
	}
}
*/


BUTTON_EVENT[dvTP, i_ch_Activities]
{
	PUSH:
	{
		ON[dvTP, BUTTON.INPUT.CHANNEL]
		
		SWITCH (GET_LAST(i_ch_Activities))
		{			
			CASE 2: //Audio
			{
				SWITCH (UILanguage)
				{
					CASE 'fr': 	CALL 'sendUnicodeString' (I_A_AV_TOP, _WC('Audio'))
					CASE 'en': 	CALL 'sendUnicodeString' (I_A_AV_TOP, _WC('Audio'))
					CASE 'ru': 	CALL 'sendUnicodeString' (I_A_AV_TOP, _WC('Аудио'))
				}		
				
				SEND_COMMAND dvTP, "'^SHO-', ITOA(I_A_AV_PARTY),',1'" //Show the party mode button
				SEND_COMMAND dvTP, "'^SHO-', ITOA(I_A_AV_MOVIE),',0'" //Hide the movie mode button
			}
			CASE 1: //Video
			{
				SWITCH (UILanguage)
				{
					CASE 'fr': 	CALL 'sendUnicodeString' (I_A_AV_TOP, _WC('Vidéo'))
					CASE 'en': 	CALL 'sendUnicodeString' (I_A_AV_TOP, _WC('Video'))
					CASE 'ru': 	CALL 'sendUnicodeString' (I_A_AV_TOP, _WC('Видео'))
				}
				
				SEND_COMMAND dvTP, "'^SHO-', ITOA(I_A_AV_PARTY),',0'" //Hide the party mode button
				SEND_COMMAND dvTP, "'^SHO-', ITOA(I_A_AV_MOVIE),',1'" //Show the movie mode button				
			}
			
			CASE 20: //AV Off
			{
				OFF[dvTP, i_ch_Activities[ 1]]
				OFF[dvTP, i_ch_Activities[ 2]]
			}
		}
	}
}


TIMELINE_EVENT[TIMELINE_DEFINE_PROGRAM_MODULES]
{
	RefreshTime()
}