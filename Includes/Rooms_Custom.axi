PROGRAM_NAME='Rooms_Custom'

DEFINE_CONSTANT

DEFINE_CALL 'Default_Volume'
{
// VALEURS¨PAR DEFAUT DE BASE

//-----------------------------------------------------------------------------
/*
	rooms[ 1].vol_START[BEDROOM]			= 20 // 200
	rooms[ 2].vol_START[BEDROOM]			= 20 // 201
	rooms[ 3].vol_START[BEDROOM]			= 20 // 202
	rooms[ 4].vol_START[BEDROOM]			= 20 // 203
	rooms[ 5].vol_START[BEDROOM]			= 20 // 301
	rooms[ 6].vol_START[BEDROOM]			= 20 // 302
	rooms[ 7].vol_START[BEDROOM]			= 20 // 303
	rooms[ 8].vol_START[BEDROOM]			= 20 // 401
	rooms[ 9].vol_START[BEDROOM]			= 20 // 402
	rooms[10].vol_START[BEDROOM]			= 20 // 403


	rooms[ 1].vol_START[BATHROOM]			= 20 // 200
	rooms[ 2].vol_START[BATHROOM]			= 20 // 201
	rooms[ 3].vol_START[BATHROOM]			= 20 // 202
	rooms[ 4].vol_START[BATHROOM]			= 20 // 203
	rooms[ 5].vol_START[BATHROOM]			= 20 // 301
	rooms[ 6].vol_START[BATHROOM]			= 20 // 302
	rooms[ 7].vol_START[BATHROOM]			= 20 // 303
	rooms[ 8].vol_START[BATHROOM]			= 20 // 401
	rooms[ 9].vol_START[BATHROOM]			= 20 // 402
	rooms[10].vol_START[BATHROOM]			= 20 // 403

//-----------------------------------------------------------------------------
	rooms[ 1].vol_MAX[BEDROOM]				= 80 // 200
	rooms[ 2].vol_MAX[BEDROOM]				= 80 // 201
	rooms[ 3].vol_MAX[BEDROOM]				= 80 // 202
	rooms[ 4].vol_MAX[BEDROOM]				= 80 // 203
	rooms[ 5].vol_MAX[BEDROOM]				= 80 // 301
	rooms[ 6].vol_MAX[BEDROOM]				= 80 // 302
	rooms[ 7].vol_MAX[BEDROOM]				= 80 // 303
	rooms[ 8].vol_MAX[BEDROOM]				= 80 // 401
	rooms[ 9].vol_MAX[BEDROOM]				= 80 // 402
	rooms[10].vol_MAX[BEDROOM]				= 80 // 403

	rooms[ 1].vol_MAX[BATHROOM]				= 80 // 200
	rooms[ 2].vol_MAX[BATHROOM]				= 80 // 201
	rooms[ 3].vol_MAX[BATHROOM]				= 80 // 202
	rooms[ 4].vol_MAX[BATHROOM]				= 80 // 203
	rooms[ 5].vol_MAX[BATHROOM]				= 80 // 301
	rooms[ 6].vol_MAX[BATHROOM]				= 80 // 302
	rooms[ 7].vol_MAX[BATHROOM]				= 80 // 303
	rooms[ 8].vol_MAX[BATHROOM]				= 80 // 401
	rooms[ 9].vol_MAX[BATHROOM]				= 80 // 402
	rooms[10].vol_MAX[BATHROOM]				= 80 // 403

//-----------------------------------------------------------------------------	
	rooms[ 1].volumeLimiteEnabled[BEDROOM]	= TRUE // 200
	rooms[ 2].volumeLimiteEnabled[BEDROOM]	= TRUE // 201
	rooms[ 3].volumeLimiteEnabled[BEDROOM]	= TRUE // 202
	rooms[ 4].volumeLimiteEnabled[BEDROOM]	= TRUE // 203
	rooms[ 5].volumeLimiteEnabled[BEDROOM]	= TRUE // 301
	rooms[ 6].volumeLimiteEnabled[BEDROOM]	= TRUE // 302
	rooms[ 7].volumeLimiteEnabled[BEDROOM]	= TRUE // 303
	rooms[ 8].volumeLimiteEnabled[BEDROOM]	= TRUE // 401
	rooms[ 9].volumeLimiteEnabled[BEDROOM]	= TRUE // 402
	rooms[10].volumeLimiteEnabled[BEDROOM]	= TRUE // 403

	rooms[ 1].volumeLimiteEnabled[BATHROOM]	= TRUE // 200
	rooms[ 2].volumeLimiteEnabled[BATHROOM]	= TRUE // 201
	rooms[ 3].volumeLimiteEnabled[BATHROOM]	= TRUE // 202
	rooms[ 4].volumeLimiteEnabled[BATHROOM]	= TRUE // 203
	rooms[ 5].volumeLimiteEnabled[BATHROOM]	= TRUE // 301
	rooms[ 6].volumeLimiteEnabled[BATHROOM]	= TRUE // 302
	rooms[ 7].volumeLimiteEnabled[BATHROOM]	= TRUE // 303
	rooms[ 8].volumeLimiteEnabled[BATHROOM]	= TRUE // 401
	rooms[ 9].volumeLimiteEnabled[BATHROOM]	= TRUE // 402
	rooms[10].volumeLimiteEnabled[BATHROOM]	= TRUE // 403

//-----------------------------------------------------------------------------	
	rooms[ 1].welcomeAudio					= TRUE // 220
	rooms[ 2].welcomeAudio					= TRUE // 221
	rooms[ 3].welcomeAudio					= TRUE // 222
	rooms[ 4].welcomeAudio					= TRUE // 223
	rooms[ 5].welcomeAudio					= TRUE // 224
	rooms[ 6].welcomeAudio					= TRUE // 225
	rooms[ 7].welcomeAudio					= TRUE // 320
	rooms[ 8].welcomeAudio					= TRUE // 321
	rooms[ 9].welcomeAudio					= TRUE // 322
	rooms[10].welcomeAudio					= TRUE // 323
*/
}

DEFINE_CALL 'roomsInit'
{
	rooms[ 1].number 	= 200
	rooms[ 1].name 		= '200'
	rooms[ 1].actived	= TRUE
	rooms[ 1].configuration[TV][BEDROOM] 		= TRUE
	rooms[ 1].configuration[TV][BATHROOM] 		= FALSE
	rooms[ 1].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[ 1].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[ 1].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[ 1].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[ 1].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[ 1].configuration[SHADES][BATHROOM] 	= TRUE
	rooms[ 1].configuration[HVAC][BEDROOM] 		= TRUE
	rooms[ 1].configuration[HVAC][BATHROOM] 	= TRUE


	rooms[ 2].number 	= 201
	rooms[ 2].name 		= '201'
	rooms[ 2].actived	= TRUE
	rooms[ 2].configuration[TV][BEDROOM] 		= TRUE
	rooms[ 2].configuration[TV][BATHROOM] 		= FALSE
	rooms[ 2].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[ 2].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[ 2].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[ 2].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[ 2].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[ 2].configuration[SHADES][BATHROOM] 	= TRUE
	rooms[ 2].configuration[HVAC][BEDROOM] 		= TRUE
	rooms[ 2].configuration[HVAC][BATHROOM] 	= TRUE

	
	rooms[ 3].number 	= 202
	rooms[ 3].name 		= '202'
	rooms[ 3].actived	= TRUE
	rooms[ 3].configuration[TV][BEDROOM] 		= TRUE
	rooms[ 3].configuration[TV][BATHROOM] 		= FALSE
	rooms[ 3].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[ 3].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[ 3].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[ 3].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[ 3].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[ 3].configuration[SHADES][BATHROOM] 	= TRUE
	rooms[ 3].configuration[HVAC][BEDROOM] 		= TRUE
	rooms[ 3].configuration[HVAC][BATHROOM] 	= TRUE


	rooms[ 4].number 	= 203
	rooms[ 4].name 		= '203'
	rooms[ 4].actived	= TRUE
	rooms[ 4].configuration[TV][BEDROOM] 		= TRUE
	rooms[ 4].configuration[TV][BATHROOM] 		= FALSE
	rooms[ 4].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[ 4].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[ 4].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[ 4].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[ 4].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[ 4].configuration[SHADES][BATHROOM] 	= TRUE
	rooms[ 4].configuration[HVAC][BEDROOM] 		= TRUE
	rooms[ 4].configuration[HVAC][BATHROOM] 	= TRUE
	
	
	rooms[ 5].number 	= 301
	rooms[ 5].name 		= 'Leonardo Da Vinci'
	rooms[ 5].actived	= TRUE
	rooms[ 5].configuration[TV][BEDROOM] 		= TRUE
	rooms[ 5].configuration[TV][BATHROOM] 		= FALSE
	rooms[ 5].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[ 5].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[ 5].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[ 5].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[ 5].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[ 5].configuration[SHADES][BATHROOM] 	= TRUE
	rooms[ 5].configuration[HVAC][BEDROOM] 		= TRUE
	rooms[ 5].configuration[HVAC][BATHROOM] 	= TRUE
	
	rooms[ 5].phantomButtonAllID_ON				= '166204'	// ALL ON
	rooms[ 5].phantomButtonAllID_OFF			= '166208'	// ALL OFF
	rooms[ 5].phantomButtonMasterID_Raise		= '166226'	// Raise
	rooms[ 5].phantomButtonMasterID_Lower		= '166224'	// Lower
	
	rooms[ 5].phantomButtonBedID_ONOFF			= '176925'	// ON/OFF	BEDROOM
	rooms[ 5].phantomButtonBedID_1				= '176929'	// Scene#1
	rooms[ 5].phantomButtonBedID_2				= '176933'	// Scene#2
	rooms[ 5].phantomButtonBedID_3				= '176937'	// Scene#3
	rooms[ 5].phantomButtonBedID_4				= '176941'	// Scene#4
	rooms[ 5].phantomButtonBedID_Raise			= '176947'	// Raise
	rooms[ 5].phantomButtonBedID_Lower			= '176945'	// Lower
	
	rooms[ 5].phantomButtonBathID_ONOFF			= '177068'	// ON/OFF	BATHROOM
	rooms[ 5].phantomButtonBathID_1				= '177072'	// Scene#1
	rooms[ 5].phantomButtonBathID_2				= '177076'	// Scene#2
	rooms[ 5].phantomButtonBathID_3				= '177080'	// Scene#3
	rooms[ 5].phantomButtonBathID_4				= '177084'	// Scene#4
	rooms[ 5].phantomButtonBathID_Raise			= '177090'	// Raise
	rooms[ 5].phantomButtonBathID_Lower			= '177088'	// Lower
	
	rooms[ 5].phantomLedBedID_ONOFF				= '176907'	// ON/OFF	BEDROOM
	rooms[ 5].phantomLedBedID_1					= '176908'	// Scene#1
	rooms[ 5].phantomLedBedID_2					= '176909'	// Scene#2
	rooms[ 5].phantomLedBedID_3					= '176910'	// Scene#3
	rooms[ 5].phantomLedBedID_4					= '176911'	// Scene#4
	
	rooms[ 5].phantomLedBathID_ONOFF			= '177062'	// ON/OFF	BATHROOM
	rooms[ 5].phantomLedBathID_1				= '177063'	// Scene#1
	rooms[ 5].phantomLedBathID_2				= '177064'	// Scene#2
	rooms[ 5].phantomLedBathID_3				= '177065'	// Scene#3
	rooms[ 5].phantomLedBathID_4				= '177066'	// Scene#4
	
	rooms[ 5].phantomButtonBedShadesOpenID		= '177151'	// Open Shades
	rooms[ 5].phantomButtonBedShadesStopID		= '177155'	// Stop Shades
	rooms[ 5].phantomButtonBedShadesCloseID		= '177159'	// Close Shades
	
	rooms[ 5].phantomButtonBedBlackoutOpenID	= '177131'	// Open Blackout
	rooms[ 5].phantomButtonBedBlackoutStopID	= '177135'	// Close Blackout
	rooms[ 5].phantomButtonBedBlackoutCloseID	= '177139'	// Close Blackout

	rooms[ 5].windowsOpenedLedID				= '166202'	// Contact Fenetre
	
	rooms[ 5].musiqueButtonID					= '7487'	// Musique Button in Bathroom
	rooms[ 5].musiqueLedID						= '7481'	// Musique Led in Bathroom

	rooms[ 5].wakeupButtonID					= '166212'	// Wake Up Button
	rooms[ 5].goodnightButtonID					= '166216'	// Good Night Button

	rooms[ 5].DND_loadID						= '138145'	// DND
	rooms[ 5].MUMR_loadID						= '138154'	// MUMR
	
	rooms[ 6].number 	= 302
	rooms[ 6].name 		= '302'
	rooms[ 6].actived	= TRUE
	rooms[ 6].configuration[TV][BEDROOM] 		= TRUE
	rooms[ 6].configuration[TV][BATHROOM] 		= FALSE
	rooms[ 6].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[ 6].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[ 6].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[ 6].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[ 6].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[ 6].configuration[SHADES][BATHROOM] 	= TRUE
	
	
	rooms[ 7].number 	= 303
	rooms[ 7].name 		= '303'
	rooms[ 7].actived	= TRUE
	rooms[ 7].configuration[TV][BEDROOM] 		= TRUE
	rooms[ 7].configuration[TV][BATHROOM] 		= FALSE
	rooms[ 7].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[ 7].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[ 7].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[ 7].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[ 7].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[ 7].configuration[SHADES][BATHROOM] 	= TRUE
	rooms[ 7].configuration[HVAC][BEDROOM] 		= TRUE
	rooms[ 7].configuration[HVAC][BATHROOM] 	= TRUE

	
	rooms[ 8].number 	= 401
	rooms[ 8].name 		= '401'
	rooms[ 8].actived	= TRUE
	rooms[ 8].configuration[TV][BEDROOM] 		= TRUE
	rooms[ 8].configuration[TV][BATHROOM] 		= FALSE
	rooms[ 8].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[ 8].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[ 8].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[ 8].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[ 8].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[ 8].configuration[SHADES][BATHROOM] 	= TRUE
	rooms[ 8].configuration[HVAC][BEDROOM] 		= TRUE
	rooms[ 8].configuration[HVAC][BATHROOM] 	= TRUE
	
	
	rooms[ 9].number 	= 402
	rooms[ 9].name 		= '402'
	rooms[ 9].actived	= TRUE
	rooms[ 9].configuration[TV][BEDROOM] 		= TRUE
	rooms[ 9].configuration[TV][BATHROOM] 		= FALSE
	rooms[ 9].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[ 9].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[ 9].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[ 9].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[ 9].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[ 9].configuration[SHADES][BATHROOM] 	= TRUE
	rooms[ 9].configuration[HVAC][BEDROOM] 		= TRUE
	rooms[ 9].configuration[HVAC][BATHROOM] 	= TRUE

	
	rooms[10].number 	= 403
	rooms[10].name 		= '403'
	rooms[10].actived	= TRUE
	rooms[10].configuration[TV][BEDROOM] 		= TRUE
	rooms[10].configuration[TV][BATHROOM] 		= FALSE
	rooms[10].configuration[SOUND][BEDROOM] 	= TRUE
	rooms[10].configuration[SOUND][BATHROOM] 	= TRUE
	rooms[10].configuration[LIGHTING][BEDROOM] 	= TRUE
	rooms[10].configuration[LIGHTING][BATHROOM] = TRUE
	rooms[10].configuration[SHADES][BEDROOM] 	= TRUE
	rooms[10].configuration[SHADES][BATHROOM] 	= TRUE
	rooms[10].configuration[HVAC][BEDROOM] 		= TRUE
	rooms[10].configuration[HVAC][BATHROOM] 	= TRUE

	
//	if(rooms[ 1].vol_MAX[BEDROOM] == 0) // PERTE DES VALEURS PERSISTANTES
//		CALL 'Default_Volume'
}