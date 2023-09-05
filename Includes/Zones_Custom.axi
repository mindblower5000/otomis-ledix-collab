PROGRAM_NAME='Zones_Custom'

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

DEFINE_CALL 'zonesInit'
{	
	// PALIER SS
	zones[ 1].phantomButtonAllID_ON			= '233279'	// ALL ON
	zones[ 1].phantomButtonAllID_OFF		= '233283'	// ALL OFF

	zones[ 1].phantomButtonGPDID_ON			= '233291'	// GPD ON
	zones[ 1].phantomButtonGPDID_OFF		= '233295'	// GPD OFF
	zones[ 1].phantomButtonID_ONOFF			= '233299'	// ON/OFF
	zones[ 1].phantomButtonID_1				= '233303'	// Scene#1
	zones[ 1].phantomButtonID_2				= '233307'	// Scene#2
	zones[ 1].phantomButtonID_3				= '233311'	// Scene#3
	zones[ 1].phantomButtonID_4				= '233315'	// Scene#4
	zones[ 1].phantomButtonID_Lower			= '233319'	// Lower
	zones[ 1].phantomButtonID_Raise			= '233321'	// Raise
		
	zones[ 1].phantomLedID_ONOFF			= '233273'	// ON/OFF
	zones[ 1].phantomLedID_1				= '233274'	// Scene#1
	zones[ 1].phantomLedID_2				= '233275'	// Scene#2
	zones[ 1].phantomLedID_3				= '233276'	// Scene#3
	zones[ 1].phantomLedID_4				= '233277'	// Scene#4
		
	zones[ 1].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[ 1].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[ 1].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[ 1].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[ 1].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[ 1].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[ 1].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// VESTIAIRES
	zones[ 2].phantomButtonAllID_ON			= '233057'	// ALL ON
	zones[ 2].phantomButtonAllID_OFF		= '233061'	// ALL OFF

	zones[ 2].phantomButtonGPDID_ON			= '233069'	// GPD ON
	zones[ 2].phantomButtonGPDID_OFF		= '233073'	// GPD OFF
	zones[ 2].phantomButtonID_ONOFF			= '233077'	// ON/OFF
	zones[ 2].phantomButtonID_1				= '233081'	// Scene#1
	zones[ 2].phantomButtonID_2				= '233085'	// Scene#2
	zones[ 2].phantomButtonID_3				= '233089'	// Scene#3
	zones[ 2].phantomButtonID_4				= '233093'	// Scene#4
	zones[ 2].phantomButtonID_Lower			= '233097'	// Lower
	zones[ 2].phantomButtonID_Raise			= '233099'	// Raise
		
	zones[ 2].phantomLedID_ONOFF			= '233051'	// ON/OFF
	zones[ 2].phantomLedID_1				= '233052'	// Scene#1
	zones[ 2].phantomLedID_2				= '233053'	// Scene#2
	zones[ 2].phantomLedID_3				= '233054'	// Scene#3
	zones[ 2].phantomLedID_4				= '233055'	// Scene#4
		
	zones[ 2].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[ 2].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[ 2].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[ 2].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[ 2].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[ 2].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[ 2].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// TISANNERIE
	zones[ 3].phantomButtonAllID_ON			= '222989'	// ALL ON
	zones[ 3].phantomButtonAllID_OFF		= '222993'	// ALL OFF

	zones[ 3].phantomButtonGPDID_ON			= '223001'	// GPD ON
	zones[ 3].phantomButtonGPDID_OFF		= '223005'	// GPD OFF
	zones[ 3].phantomButtonID_ONOFF			= '223009'	// ON/OFF
	zones[ 3].phantomButtonID_1				= '223013'	// Scene#1
	zones[ 3].phantomButtonID_2				= '223017'	// Scene#2
	zones[ 3].phantomButtonID_3				= '223021'	// Scene#3
	zones[ 3].phantomButtonID_4				= '223025'	// Scene#4
	zones[ 3].phantomButtonID_Lower			= '223029'	// Lower
	zones[ 3].phantomButtonID_Raise			= '223031'	// Raise
		
	zones[ 3].phantomLedID_ONOFF			= '222983'	// ON/OFF
	zones[ 3].phantomLedID_1				= '222984'	// Scene#1
	zones[ 3].phantomLedID_2				= '222985'	// Scene#2
	zones[ 3].phantomLedID_3				= '222986'	// Scene#3
	zones[ 3].phantomLedID_4				= '222987'	// Scene#4
		
	zones[ 3].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[ 3].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[ 3].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[ 3].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[ 3].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[ 3].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[ 3].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// BAIN JAPONAIS
	zones[ 4].phantomButtonAllID_ON			= '223137'	// ALL ON
	zones[ 4].phantomButtonAllID_OFF		= '223141'	// ALL OFF

	zones[ 4].phantomButtonGPDID_ON			= '223149'	// GPD ON
	zones[ 4].phantomButtonGPDID_OFF		= '223153'	// GPD OFF
	zones[ 4].phantomButtonID_ONOFF			= '223157'	// ON/OFF
	zones[ 4].phantomButtonID_1				= '223161'	// Scene#1
	zones[ 4].phantomButtonID_2				= '223165'	// Scene#2
	zones[ 4].phantomButtonID_3				= '223169'	// Scene#3
	zones[ 4].phantomButtonID_4				= '223173'	// Scene#4
	zones[ 4].phantomButtonID_Lower			= '223177'	// Lower
	zones[ 4].phantomButtonID_Raise			= '223179'	// Raise
		
	zones[ 4].phantomLedID_ONOFF			= '223131'	// ON/OFF
	zones[ 4].phantomLedID_1				= '223132'	// Scene#1
	zones[ 4].phantomLedID_2				= '223133'	// Scene#2
	zones[ 4].phantomLedID_3				= '223134'	// Scene#3
	zones[ 4].phantomLedID_4				= '223135'	// Scene#4
		
	zones[ 4].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[ 4].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[ 4].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[ 4].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[ 4].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[ 4].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[ 4].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// HAMMAM
	zones[ 5].phantomButtonAllID_ON			= '233439'	// ALL ON
	zones[ 5].phantomButtonAllID_OFF		= '233443'	// ALL OFF

	zones[ 5].phantomButtonGPDID_ON			= '233451'	// GPD ON
	zones[ 5].phantomButtonGPDID_OFF		= '233455'	// GPD OFF
	zones[ 5].phantomButtonID_ONOFF			= '233459'	// ON/OFF
	zones[ 5].phantomButtonID_1				= '233463'	// Scene#1
	zones[ 5].phantomButtonID_2				= '233467'	// Scene#2
	zones[ 5].phantomButtonID_3				= '233471'	// Scene#3
	zones[ 5].phantomButtonID_4				= '233475'	// Scene#4
	zones[ 5].phantomButtonID_Lower			= '233479'	// Lower
	zones[ 5].phantomButtonID_Raise			= '233481'	// Raise
		
	zones[ 5].phantomLedID_ONOFF			= '233433'	// ON/OFF
	zones[ 5].phantomLedID_1				= '233434'	// Scene#1
	zones[ 5].phantomLedID_2				= '233435'	// Scene#2
	zones[ 5].phantomLedID_3				= '233436'	// Scene#3
	zones[ 5].phantomLedID_4				= '233437'	// Scene#4
		
	zones[ 5].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[ 5].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[ 5].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[ 5].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[ 5].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[ 5].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[ 5].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// SAUNA
	zones[ 6].phantomButtonAllID_ON			= '233365'	// ALL ON
	zones[ 6].phantomButtonAllID_OFF		= '233369'	// ALL OFF

	zones[ 6].phantomButtonGPDID_ON			= '233377'	// GPD ON
	zones[ 6].phantomButtonGPDID_OFF		= '233381'	// GPD OFF
	zones[ 6].phantomButtonID_ONOFF			= '233385'	// ON/OFF
	zones[ 6].phantomButtonID_1				= '233389'	// Scene#1
	zones[ 6].phantomButtonID_2				= '233393'	// Scene#2
	zones[ 6].phantomButtonID_3				= '233397'	// Scene#3
	zones[ 6].phantomButtonID_4				= '233401'	// Scene#4
	zones[ 6].phantomButtonID_Lower			= '233405'	// Lower
	zones[ 6].phantomButtonID_Raise			= '233407'	// Raise
		
	zones[ 6].phantomLedID_ONOFF			= '233359'	// ON/OFF
	zones[ 6].phantomLedID_1				= '233360'	// Scene#1
	zones[ 6].phantomLedID_2				= '233361'	// Scene#2
	zones[ 6].phantomLedID_3				= '233362'	// Scene#3
	zones[ 6].phantomLedID_4				= '233363'	// Scene#4
		
	zones[ 6].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[ 6].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[ 6].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[ 6].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[ 6].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[ 6].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[ 6].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// SHIDEIDO
	zones[ 7].phantomButtonAllID_ON			= '223211'	// ALL ON
	zones[ 7].phantomButtonAllID_OFF		= '223215'	// ALL OFF

	zones[ 7].phantomButtonGPDID_ON			= '223223'	// GPD ON
	zones[ 7].phantomButtonGPDID_OFF		= '223227'	// GPD OFF
	zones[ 7].phantomButtonID_ONOFF			= '223231'	// ON/OFF
	zones[ 7].phantomButtonID_1				= '223235'	// Scene#1
	zones[ 7].phantomButtonID_2				= '223239'	// Scene#2
	zones[ 7].phantomButtonID_3				= '223243'	// Scene#3
	zones[ 7].phantomButtonID_4				= '223247'	// Scene#4
	zones[ 7].phantomButtonID_Lower			= '223251'	// Lower
	zones[ 7].phantomButtonID_Raise			= '223253'	// Raise
		
	zones[ 7].phantomLedID_ONOFF			= '223205'	// ON/OFF
	zones[ 7].phantomLedID_1				= '223206'	// Scene#1
	zones[ 7].phantomLedID_2				= '223207'	// Scene#2
	zones[ 7].phantomLedID_3				= '223208'	// Scene#3
	zones[ 7].phantomLedID_4				= '223209'	// Scene#4
		
	zones[ 7].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[ 7].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[ 7].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[ 7].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[ 7].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[ 7].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[ 7].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// DOUCHE BAMBOU
	zones[ 8].phantomButtonAllID_ON			= '223063'	// ALL ON
	zones[ 8].phantomButtonAllID_OFF		= '223067'	// ALL OFF

	zones[ 8].phantomButtonGPDID_ON			= '223075'	// GPD ON
	zones[ 8].phantomButtonGPDID_OFF		= '223079'	// GPD OFF
	zones[ 8].phantomButtonID_ONOFF			= '223083'	// ON/OFF
	zones[ 8].phantomButtonID_1				= '223087'	// Scene#1
	zones[ 8].phantomButtonID_2				= '223091'	// Scene#2
	zones[ 8].phantomButtonID_3				= '223095'	// Scene#3
	zones[ 8].phantomButtonID_4				= '223099'	// Scene#4
	zones[ 8].phantomButtonID_Lower			= '223103'	// Lower
	zones[ 8].phantomButtonID_Raise			= '223105'	// Raise
		
	zones[ 8].phantomLedID_ONOFF			= '223057'	// ON/OFF
	zones[ 8].phantomLedID_1				= '223058'	// Scene#1
	zones[ 8].phantomLedID_2				= '223059'	// Scene#2
	zones[ 8].phantomLedID_3				= '223060'	// Scene#3
	zones[ 8].phantomLedID_4				= '223061'	// Scene#4
		
	zones[ 8].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[ 8].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[ 8].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[ 8].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[ 8].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[ 8].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[ 8].windowsOpenedLedID			= '00000'	// Contact Fenetre
	
	// DOUCHE SAUNA
	zones[ 9].phantomButtonAllID_ON			= '233131'	// ALL ON
	zones[ 9].phantomButtonAllID_OFF		= '233135'	// ALL OFF

	zones[ 9].phantomButtonGPDID_ON			= '233143'	// GPD ON
	zones[ 9].phantomButtonGPDID_OFF		= '233147'	// GPD OFF
	zones[ 9].phantomButtonID_ONOFF			= '233151'	// ON/OFF
	zones[ 9].phantomButtonID_1				= '233155'	// Scene#1
	zones[ 9].phantomButtonID_2				= '233159'	// Scene#2
	zones[ 9].phantomButtonID_3				= '233163'	// Scene#3
	zones[ 9].phantomButtonID_4				= '233167'	// Scene#4
	zones[ 9].phantomButtonID_Lower			= '233171'	// Lower
	zones[ 9].phantomButtonID_Raise			= '233173'	// Raise
		
	zones[ 9].phantomLedID_ONOFF			= '233125'	// ON/OFF
	zones[ 9].phantomLedID_1				= '233126'	// Scene#1
	zones[ 9].phantomLedID_2				= '233127'	// Scene#2
	zones[ 9].phantomLedID_3				= '233128'	// Scene#3
	zones[ 9].phantomLedID_4				= '233129'	// Scene#4
		
	zones[ 9].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[ 9].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[ 9].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[ 9].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[ 9].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[ 9].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[ 9].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// WC SOUS-SOL
	zones[10].phantomButtonAllID_ON			= '233513'	// ALL ON
	zones[10].phantomButtonAllID_OFF		= '233517'	// ALL OFF

	zones[10].phantomButtonGPDID_ON			= '233525'	// GPD ON
	zones[10].phantomButtonGPDID_OFF		= '233529'	// GPD OFF
	zones[10].phantomButtonID_ONOFF			= '233533'	// ON/OFF
	zones[10].phantomButtonID_1				= '233537'	// Scene#1
	zones[10].phantomButtonID_2				= '233541'	// Scene#2
	zones[10].phantomButtonID_3				= '233545'	// Scene#3
	zones[10].phantomButtonID_4				= '233549'	// Scene#4
	zones[10].phantomButtonID_Lower			= '233553'	// Lower
	zones[10].phantomButtonID_Raise			= '233555'	// Raise
		
	zones[10].phantomLedID_ONOFF			= '233507'	// ON/OFF
	zones[10].phantomLedID_1				= '233508'	// Scene#1
	zones[10].phantomLedID_2				= '233509'	// Scene#2
	zones[10].phantomLedID_3				= '233510'	// Scene#3
	zones[10].phantomLedID_4				= '233511'	// Scene#4
		
	zones[10].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[10].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[10].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[10].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[10].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[10].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[10].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// ACCUEIL PAVILLON
	zones[11].phantomButtonAllID_ON			= '223285'	// ALL ON
	zones[11].phantomButtonAllID_OFF		= '223289'	// ALL OFF

	zones[11].phantomButtonGPDID_ON			= '223297'	// GPD ON
	zones[11].phantomButtonGPDID_OFF		= '223301'	// GPD OFF
	zones[11].phantomButtonID_ONOFF			= '223305'	// ON/OFF
	zones[11].phantomButtonID_1				= '223309'	// Scene#1
	zones[11].phantomButtonID_2				= '223313'	// Scene#2
	zones[11].phantomButtonID_3				= '223317'	// Scene#3
	zones[11].phantomButtonID_4				= '223321'	// Scene#4
	zones[11].phantomButtonID_Lower			= '223325'	// Lower
	zones[11].phantomButtonID_Raise			= '223327'	// Raise
		
	zones[11].phantomLedID_ONOFF			= '223279'	// ON/OFF
	zones[11].phantomLedID_1				= '223280'	// Scene#1
	zones[11].phantomLedID_2				= '223281'	// Scene#2
	zones[11].phantomLedID_3				= '223282'	// Scene#3
	zones[11].phantomLedID_4				= '223283'	// Scene#4
		
	zones[11].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[11].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[11].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[11].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[11].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[11].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[11].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// GRAND SALON
	zones[12].phantomButtonAllID_ON			= '223359'	// ALL ON
	zones[12].phantomButtonAllID_OFF		= '223363'	// ALL OFF

	zones[12].phantomButtonGPDID_ON			= '223371'	// GPD ON
	zones[12].phantomButtonGPDID_OFF		= '223375'	// GPD OFF
	zones[12].phantomButtonID_ONOFF			= '223379'	// ON/OFF
	zones[12].phantomButtonID_1				= '223383'	// Scene#1
	zones[12].phantomButtonID_2				= '223387'	// Scene#2
	zones[12].phantomButtonID_3				= '223391'	// Scene#3
	zones[12].phantomButtonID_4				= '223395'	// Scene#4
	zones[12].phantomButtonID_Lower			= '223399'	// Lower
	zones[12].phantomButtonID_Raise			= '223401'	// Raise
		
	zones[12].phantomLedID_ONOFF			= '223353'	// ON/OFF
	zones[12].phantomLedID_1				= '223354'	// Scene#1
	zones[12].phantomLedID_2				= '223355'	// Scene#2
	zones[12].phantomLedID_3				= '223356'	// Scene#3
	zones[12].phantomLedID_4				= '223357'	// Scene#4
		
	zones[12].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[12].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[12].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[12].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[12].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[12].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[12].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// SAM
	zones[13].phantomButtonAllID_ON			= '223433'	// ALL ON
	zones[13].phantomButtonAllID_OFF		= '223437'	// ALL OFF

	zones[13].phantomButtonGPDID_ON			= '223445'	// GPD ON
	zones[13].phantomButtonGPDID_OFF		= '223449'	// GPD OFF
	zones[13].phantomButtonID_ONOFF			= '223453'	// ON/OFF
	zones[13].phantomButtonID_1				= '223457'	// Scene#1
	zones[13].phantomButtonID_2				= '223461'	// Scene#2
	zones[13].phantomButtonID_3				= '223465'	// Scene#3
	zones[13].phantomButtonID_4				= '223469'	// Scene#4
	zones[13].phantomButtonID_Lower			= '223473'	// Lower
	zones[13].phantomButtonID_Raise			= '223475'	// Raise
		
	zones[13].phantomLedID_ONOFF			= '223427'	// ON/OFF
	zones[13].phantomLedID_1				= '223428'	// Scene#1
	zones[13].phantomLedID_2				= '223429'	// Scene#2
	zones[13].phantomLedID_3				= '223430'	// Scene#3
	zones[13].phantomLedID_4				= '223431'	// Scene#4
		
	zones[13].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[13].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[13].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[13].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[13].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[13].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[13].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// RESTAURANT (ATELIER dans Lutron & BSS)
	zones[14].phantomButtonAllID_ON			= '223581'	// ALL ON
	zones[14].phantomButtonAllID_OFF		= '223585'	// ALL OFF

	zones[14].phantomButtonGPDID_ON			= '223593'	// GPD ON
	zones[14].phantomButtonGPDID_OFF		= '223597'	// GPD OFF
	zones[14].phantomButtonID_ONOFF			= '223601'	// ON/OFF
	zones[14].phantomButtonID_1				= '223605'	// Scene#1
	zones[14].phantomButtonID_2				= '223609'	// Scene#2
	zones[14].phantomButtonID_3				= '223613'	// Scene#3
	zones[14].phantomButtonID_4				= '223617'	// Scene#4
	zones[14].phantomButtonID_Lower			= '223621'	// Lower
	zones[14].phantomButtonID_Raise			= '223623'	// Raise
		
	zones[14].phantomLedID_ONOFF			= '223575'	// ON/OFF
	zones[14].phantomLedID_1				= '223576'	// Scene#1
	zones[14].phantomLedID_2				= '223577'	// Scene#2
	zones[14].phantomLedID_3				= '223578'	// Scene#3
	zones[14].phantomLedID_4				= '223579'	// Scene#4
		
	zones[14].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[14].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[14].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[14].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[14].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[14].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[14].windowsOpenedLedID			= '00000'	// Contact Fenetre	

	// ATELIER (CUISINE dans Lutron et BSS)
	zones[15].phantomButtonAllID_ON			= '223507'	// ALL ON
	zones[15].phantomButtonAllID_OFF		= '223511'	// ALL OFF

	zones[15].phantomButtonGPDID_ON			= '223519'	// GPD ON
	zones[15].phantomButtonGPDID_OFF		= '223523'	// GPD OFF
	zones[15].phantomButtonID_ONOFF			= '223527'	// ON/OFF
	zones[15].phantomButtonID_1				= '223531'	// Scene#1
	zones[15].phantomButtonID_2				= '223535'	// Scene#2
	zones[15].phantomButtonID_3				= '223539'	// Scene#3
	zones[15].phantomButtonID_4				= '223543'	// Scene#4
	zones[15].phantomButtonID_Lower			= '223547'	// Lower
	zones[15].phantomButtonID_Raise			= '223549'	// Raise
		
	zones[15].phantomLedID_ONOFF			= '223501'	// ON/OFF
	zones[15].phantomLedID_1				= '223502'	// Scene#1
	zones[15].phantomLedID_2				= '223503'	// Scene#2
	zones[15].phantomLedID_3				= '223504'	// Scene#3
	zones[15].phantomLedID_4				= '223505'	// Scene#4
		
	zones[15].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[15].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[15].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[15].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[15].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[15].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[15].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// JARDIN
	zones[16].phantomButtonAllID_ON			= '223947'	// ALL ON
	zones[16].phantomButtonAllID_OFF		= '223951'	// ALL OFF

	zones[16].phantomButtonGPDID_ON			= '223959'	// GPD ON
	zones[16].phantomButtonGPDID_OFF		= '223963'	// GPD OFF
	zones[16].phantomButtonID_ONOFF			= '223967'	// ON/OFF
	zones[16].phantomButtonID_1				= '223971'	// Scene#1
	zones[16].phantomButtonID_2				= '223975'	// Scene#2
	zones[16].phantomButtonID_3				= '223979'	// Scene#3
	zones[16].phantomButtonID_4				= '223983'	// Scene#4
	zones[16].phantomButtonID_Lower			= '223987'	// Lower
	zones[16].phantomButtonID_Raise			= '223989'	// Raise
		
	zones[16].phantomLedID_ONOFF			= '223941'	// ON/OFF
	zones[16].phantomLedID_1				= '223942'	// Scene#1
	zones[16].phantomLedID_2				= '223943'	// Scene#2
	zones[16].phantomLedID_3				= '223944'	// Scene#3
	zones[16].phantomLedID_4				= '223945'	// Scene#4
		
	zones[16].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[16].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[16].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[16].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[16].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[16].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[16].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// BAR
	zones[17].phantomButtonAllID_ON			= '224507'	// ALL ON
	zones[17].phantomButtonAllID_OFF		= '224511'	// ALL OFF

	zones[17].phantomButtonGPDID_ON			= '224519'	// GPD ON
	zones[17].phantomButtonGPDID_OFF		= '224523'	// GPD OFF
	zones[17].phantomButtonID_ONOFF			= '224527'	// ON/OFF
	zones[17].phantomButtonID_1				= '224531'	// Scene#1
	zones[17].phantomButtonID_2				= '224535'	// Scene#2
	zones[17].phantomButtonID_3				= '224539'	// Scene#3
	zones[17].phantomButtonID_4				= '224543'	// Scene#4
	zones[17].phantomButtonID_Lower			= '224547'	// Lower
	zones[17].phantomButtonID_Raise			= '224549'	// Raise
		
	zones[17].phantomLedID_ONOFF			= '224501'	// ON/OFF
	zones[17].phantomLedID_1				= '224502'	// Scene#1
	zones[17].phantomLedID_2				= '224503'	// Scene#2
	zones[17].phantomLedID_3				= '224504'	// Scene#3
	zones[17].phantomLedID_4				= '224505'	// Scene#4
		
	zones[17].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[17].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[17].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[17].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[17].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[17].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[17].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// PALIER RDC
	zones[18].phantomButtonAllID_ON			= '224769'	// ALL ON
	zones[18].phantomButtonAllID_OFF		= '224773'	// ALL OFF

	zones[18].phantomButtonGPDID_ON			= '224781'	// GPD ON
	zones[18].phantomButtonGPDID_OFF		= '224785'	// GPD OFF
	zones[18].phantomButtonID_ONOFF			= '224789'	// ON/OFF
	zones[18].phantomButtonID_1				= '224793'	// Scene#1
	zones[18].phantomButtonID_2				= '224797'	// Scene#2
	zones[18].phantomButtonID_3				= '224801'	// Scene#3
	zones[18].phantomButtonID_4				= '224805'	// Scene#4
	zones[18].phantomButtonID_Lower			= '224809'	// Lower
	zones[18].phantomButtonID_Raise			= '224811'	// Raise
		
	zones[18].phantomLedID_ONOFF			= '224763'	// ON/OFF
	zones[18].phantomLedID_1				= '224764'	// Scene#1
	zones[18].phantomLedID_2				= '224765'	// Scene#2
	zones[18].phantomLedID_3				= '224766'	// Scene#3
	zones[18].phantomLedID_4				= '224767'	// Scene#4
		
	zones[18].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[18].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[18].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[18].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[18].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[18].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[18].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// EIFFEL
	zones[19].phantomButtonAllID_ON			= '224264'	// ALL ON
	zones[19].phantomButtonAllID_OFF		= '224268'	// ALL OFF

	zones[19].phantomButtonGPDID_ON			= '224276'	// GPD ON
	zones[19].phantomButtonGPDID_OFF		= '224280'	// GPD OFF
	zones[19].phantomButtonID_ONOFF			= '224284'	// ON/OFF
	zones[19].phantomButtonID_1				= '224288'	// Scene#1
	zones[19].phantomButtonID_2				= '224292'	// Scene#2
	zones[19].phantomButtonID_3				= '224296'	// Scene#3
	zones[19].phantomButtonID_4				= '224300'	// Scene#4
	zones[19].phantomButtonID_Lower			= '224304'	// Lower
	zones[19].phantomButtonID_Raise			= '224306'	// Raise
		
	zones[19].phantomLedID_ONOFF			= '224258'	// ON/OFF
	zones[19].phantomLedID_1				= '224259'	// Scene#1
	zones[19].phantomLedID_2				= '224260'	// Scene#2
	zones[19].phantomLedID_3				= '224261'	// Scene#3
	zones[19].phantomLedID_4				= '224262'	// Scene#4
		
	zones[19].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[19].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[19].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[19].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[19].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[19].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[19].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// TRONQUOIS
	zones[20].phantomButtonAllID_ON			= '224095'	// ALL ON
	zones[20].phantomButtonAllID_OFF		= '224099'	// ALL OFF

	zones[20].phantomButtonGPDID_ON			= '224107'	// GPD ON
	zones[20].phantomButtonGPDID_OFF		= '224111'	// GPD OFF
	zones[20].phantomButtonID_ONOFF			= '224115'	// ON/OFF
	zones[20].phantomButtonID_1				= '224119'	// Scene#1
	zones[20].phantomButtonID_2				= '224123'	// Scene#2
	zones[20].phantomButtonID_3				= '224127'	// Scene#3
	zones[20].phantomButtonID_4				= '224131'	// Scene#4
	zones[20].phantomButtonID_Lower			= '224135'	// Lower
	zones[20].phantomButtonID_Raise			= '224137'	// Raise
		
	zones[20].phantomLedID_ONOFF			= '224089'	// ON/OFF
	zones[20].phantomLedID_1				= '224090'	// Scene#1
	zones[20].phantomLedID_2				= '224091'	// Scene#2
	zones[20].phantomLedID_3				= '224092'	// Scene#3
	zones[20].phantomLedID_4				= '224093'	// Scene#4
		
	zones[20].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[20].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[20].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[20].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[20].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[20].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[20].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// SANITAIRES (TOILETTE TRANSPARENTE)
	zones[21].phantomButtonAllID_ON			= '224169'	// ALL ON
	zones[21].phantomButtonAllID_OFF		= '224173'	// ALL OFF

	zones[21].phantomButtonGPDID_ON			= '224181'	// GPD ON
	zones[21].phantomButtonGPDID_OFF		= '224185'	// GPD OFF
	zones[21].phantomButtonID_ONOFF			= '224189'	// ON/OFF
	zones[21].phantomButtonID_1				= '224193'	// Scene#1
	zones[21].phantomButtonID_2				= '224197'	// Scene#2
	zones[21].phantomButtonID_3				= '224201'	// Scene#3
	zones[21].phantomButtonID_4				= '224205'	// Scene#4
	zones[21].phantomButtonID_Lower			= '224209'	// Lower
	zones[21].phantomButtonID_Raise			= '224211'	// Raise
		
	zones[21].phantomLedID_ONOFF			= '224163'	// ON/OFF
	zones[21].phantomLedID_1				= '224164'	// Scene#1
	zones[21].phantomLedID_2				= '224165'	// Scene#2
	zones[21].phantomLedID_3				= '224166'	// Scene#3
	zones[21].phantomLedID_4				= '224167'	// Scene#4
		
	zones[21].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[21].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[21].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[21].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[21].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[21].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[21].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// PALIER R+1
	zones[22].phantomButtonAllID_ON			= '237755'	// ALL ON
	zones[22].phantomButtonAllID_OFF		= '237759'	// ALL OFF

	zones[22].phantomButtonGPDID_ON			= '237767'	// GPD ON
	zones[22].phantomButtonGPDID_OFF		= '237771'	// GPD OFF
	zones[22].phantomButtonID_ONOFF			= '237775'	// ON/OFF
	zones[22].phantomButtonID_1				= '237779'	// Scene#1
	zones[22].phantomButtonID_2				= '237783'	// Scene#2
	zones[22].phantomButtonID_3				= '237787'	// Scene#3
	zones[22].phantomButtonID_4				= '237791'	// Scene#4
	zones[22].phantomButtonID_Lower			= '237795'	// Lower
	zones[22].phantomButtonID_Raise			= '237797'	// Raise
		
	zones[22].phantomLedID_ONOFF			= '237749'	// ON/OFF
	zones[22].phantomLedID_1				= '237750'	// Scene#1
	zones[22].phantomLedID_2				= '237751'	// Scene#2
	zones[22].phantomLedID_3				= '237752'	// Scene#3
	zones[22].phantomLedID_4				= '237753'	// Scene#4
		
	zones[22].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[22].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[22].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[22].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[22].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[22].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[22].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// TERRASSE
	zones[23].phantomButtonAllID_ON			= '238101'	// ALL ON
	zones[23].phantomButtonAllID_OFF		= '238105'	// ALL OFF

	zones[23].phantomButtonGPDID_ON			= '238113'	// GPD ON
	zones[23].phantomButtonGPDID_OFF		= '238117'	// GPD OFF
	zones[23].phantomButtonID_ONOFF			= '238121'	// ON/OFF
	zones[23].phantomButtonID_1				= '238125'	// Scene#1
	zones[23].phantomButtonID_2				= '238129'	// Scene#2
	zones[23].phantomButtonID_3				= '238133'	// Scene#3
	zones[23].phantomButtonID_4				= '238137'	// Scene#4
	zones[23].phantomButtonID_Lower			= '238141'	// Lower
	zones[23].phantomButtonID_Raise			= '238143'	// Raise
		
	zones[23].phantomLedID_ONOFF			= '238095'	// ON/OFF
	zones[23].phantomLedID_1				= '238096'	// Scene#1
	zones[23].phantomLedID_2				= '238097'	// Scene#2
	zones[23].phantomLedID_3				= '238098'	// Scene#3
	zones[23].phantomLedID_4				= '238099'	// Scene#4
		
	zones[23].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[23].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[23].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[23].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[23].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[23].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[23].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// BUREAU
	zones[24].phantomButtonAllID_ON			= '224021'	// ALL ON
	zones[24].phantomButtonAllID_OFF		= '224025'	// ALL OFF

	zones[24].phantomButtonGPDID_ON			= '224033'	// GPD ON
	zones[24].phantomButtonGPDID_OFF		= '224037'	// GPD OFF
	zones[24].phantomButtonID_ONOFF			= '224041'	// ON/OFF
	zones[24].phantomButtonID_1				= '224045'	// Scene#1
	zones[24].phantomButtonID_2				= '224049'	// Scene#2
	zones[24].phantomButtonID_3				= '224053'	// Scene#3
	zones[24].phantomButtonID_4				= '224057'	// Scene#4
	zones[24].phantomButtonID_Lower			= '224061'	// Lower
	zones[24].phantomButtonID_Raise			= '224063'	// Raise
		
	zones[24].phantomLedID_ONOFF			= '224015'	// ON/OFF
	zones[24].phantomLedID_1				= '224016'	// Scene#1
	zones[24].phantomLedID_2				= '224017'	// Scene#2
	zones[24].phantomLedID_3				= '224018'	// Scene#3
	zones[24].phantomLedID_4				= '224019'	// Scene#4
		
	zones[24].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[24].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[24].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[24].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[24].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[24].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[24].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// PALIER PAVILLON
	zones[25].phantomButtonAllID_ON			= '237917'	// ALL ON
	zones[25].phantomButtonAllID_OFF		= '237921'	// ALL OFF

	zones[25].phantomButtonGPDID_ON			= '237929'	// GPD ON
	zones[25].phantomButtonGPDID_OFF		= '237933'	// GPD OFF
	zones[25].phantomButtonID_ONOFF			= '237937'	// ON/OFF
	zones[25].phantomButtonID_1				= '237941'	// Scene#1
	zones[25].phantomButtonID_2				= '237945'	// Scene#2
	zones[25].phantomButtonID_3				= '237949'	// Scene#3
	zones[25].phantomButtonID_4				= '237953'	// Scene#4
	zones[25].phantomButtonID_Lower			= '237957'	// Lower
	zones[25].phantomButtonID_Raise			= '237959'	// Raise
		
	zones[25].phantomLedID_ONOFF			= '237911'	// ON/OFF
	zones[25].phantomLedID_1				= '237912'	// Scene#1
	zones[25].phantomLedID_2				= '237913'	// Scene#2
	zones[25].phantomLedID_3				= '237914'	// Scene#3
	zones[25].phantomLedID_4				= '237915'	// Scene#4
		
	zones[25].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[25].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[25].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[25].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[25].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[25].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[25].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// VISION DU MONDE
	zones[26].phantomButtonAllID_ON			= '239519'	// ALL ON
	zones[26].phantomButtonAllID_OFF		= '239523'	// ALL OFF

	zones[26].phantomButtonGPDID_ON			= '239531'	// GPD ON
	zones[26].phantomButtonGPDID_OFF		= '239535'	// GPD OFF
	zones[26].phantomButtonID_ONOFF			= '239539'	// ON/OFF
	zones[26].phantomButtonID_1				= '239543'	// Scene#1
	zones[26].phantomButtonID_2				= '239547'	// Scene#2
	zones[26].phantomButtonID_3				= '239551'	// Scene#3
	zones[26].phantomButtonID_4				= '239555'	// Scene#4
	zones[26].phantomButtonID_Lower			= '239559'	// Lower
	zones[26].phantomButtonID_Raise			= '239561'	// Raise
		
	zones[26].phantomLedID_ONOFF			= '239513'	// ON/OFF
	zones[26].phantomLedID_1				= '239514'	// Scene#1
	zones[26].phantomLedID_2				= '239515'	// Scene#2
	zones[26].phantomLedID_3				= '239516'	// Scene#3
	zones[26].phantomLedID_4				= '239517'	// Scene#4
		
	zones[26].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[26].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[26].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[26].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[26].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[26].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[26].windowsOpenedLedID			= '00000'	// Contact Fenetre

	// PIGEONNIER
	zones[27].phantomButtonAllID_ON			= '239605'	// ALL ON
	zones[27].phantomButtonAllID_OFF		= '239609'	// ALL OFF

	zones[27].phantomButtonGPDID_ON			= '239617'	// GPD ON
	zones[27].phantomButtonGPDID_OFF		= '239621'	// GPD OFF
	zones[27].phantomButtonID_ONOFF			= '239625'	// ON/OFF
	zones[27].phantomButtonID_1				= '239629'	// Scene#1
	zones[27].phantomButtonID_2				= '239633'	// Scene#2
	zones[27].phantomButtonID_3				= '239637'	// Scene#3
	zones[27].phantomButtonID_4				= '239641'	// Scene#4
	zones[27].phantomButtonID_Lower			= '239645'	// Lower
	zones[27].phantomButtonID_Raise			= '239647'	// Raise
		
	zones[27].phantomLedID_ONOFF			= '239599'	// ON/OFF
	zones[27].phantomLedID_1				= '239600'	// Scene#1
	zones[27].phantomLedID_2				= '239601'	// Scene#2
	zones[27].phantomLedID_3				= '239602'	// Scene#3
	zones[27].phantomLedID_4				= '239603'	// Scene#4
		
	zones[27].phantomButtonShadesOpenID		= '00000'	// Open Shades
	zones[27].phantomButtonShadesStopID		= '00000'	// Stop Shades
	zones[27].phantomButtonShadesCloseID	= '00000'	// Close Shades
	
	zones[27].phantomButtonBlackoutOpenID	= '00000'	// Open Blackout
	zones[27].phantomButtonBlackoutStopID	= '00000'	// Close Blackout
	zones[27].phantomButtonBlackoutCloseID	= '00000'	// Close Blackout

	zones[27].windowsOpenedLedID			= '00000'	// Contact Fenetre
	
//	if(rooms[ 1].vol_MAX[BEDROOM] == 0) // PERTE DES VALEURS PERSISTANTES
//		CALL 'Default_Volume'
}