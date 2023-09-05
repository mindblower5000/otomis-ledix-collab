PROGRAM_NAME='PC_TPs'

DEFINE_DEVICE
	//-----------------------------------------------------------------------------
	// Touch Panels Parties Communes ----------------------------------------------
	// One port for each controller Port 1 = System 1, Port 2 = System 2... -------
	//-----------------------------------------------------------------------------
	dvTP_iPad_0_Root			= 11050:1:1	//Root
	dvTP_iPad_1_Bien			= 11051:1:1	//Ipad Bien-Ãªtre
	dvTP_iPad_2_Shiseido		= 11052:1:1	//Ipad Shiseido	
	dvTP_iPad_3_Accueil			= 11053:1:1	//Ipad Accueil Pavillon	
	dvTP_iPad_4_Atelier			= 11054:1:1	//Ipad Atelier T. Marx	
	dvTP_iPad_5_SalonEiffel		= 11055:1:1	//Ipad Salon Eiffel	
	dvTP_iPad_6_SalonTronquois	= 11056:1:1	//Ipad Salon Tronquois	
	dvTP_iPad_7_Visions			= 11057:1:1	//Ipad Visions du Monde	
	dvTP_iPad_8_Surface			= 11058:1:1	//Interface supervision - Surface HT	
	dvTP_iPad_9_Super			= 11059:1:1	//Interface client iPhone / Android iPad supervision

DEFINE_CONSTANT
	//-----------------------------------------------------------------------------
	// Touch Panels Parties Communes-----------------------------------------------
	//-----------------------------------------------------------------------------	
	EFFECTIVE_TP_NB_PC 	= 10	

	//-----------------------------------------------------------------------------
	// Touchpanels Rooms ----------------------------------------------------------
	//-----------------------------------------------------------------------------	
	EFFECTIVE_TP_NB_ROOMS 	= 10
	
DEFINE_VARIABLE
	//-----------------------------------------------------------------------------
	// Touch Panels Parties Communes ----------------------------------------------
	//-----------------------------------------------------------------------------
	CONSTANT DEV TPTab[EFFECTIVE_TP_NB]  = 
	{
	dvTP_iPad_0_Root		,	//1 
	dvTP_iPad_1_Bien		,       //2
	dvTP_iPad_2_Shiseido		,       //3
	dvTP_iPad_3_Accueil		,       //4
	dvTP_iPad_4_Atelier		,       //5
	dvTP_iPad_5_SalonEiffel		,       //6
	dvTP_iPad_6_SalonTronquois	,       //7
	dvTP_iPad_7_Visions		,       //8
	dvTP_iPad_8_Surface		,       //9
	dvTP_iPad_9_Super		       //10
	 
	}
	
	//-----------------------------------------------------------------------------
	// Touchpanels Rooms ----------------------------------------------------------
	//-----------------------------------------------------------------------------	
	constant dev i_TPTabRooms[EFFECTIVE_TP_NB_ROOMS]
