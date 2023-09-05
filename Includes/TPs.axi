PROGRAM_NAME='Rooms_TPs'

DEFINE_DEVICE
	//-----------------------------------------------------------------------------
	// Touchpanels Rooms ----------------------------------------------------------
	//-----------------------------------------------------------------------------
	dvTP_I_200			= 10200:1:1
	dvTP_V_200			= 10200:2:1
	dvTP_A_200			= 10200:3:1
	dvTP_LS_200			= 10200:4:1
	dvTP_H_200			= 10200:5:1

	dvTP_I_201			= 10201:1:1
	dvTP_V_201			= 10201:2:1
	dvTP_A_201			= 10201:3:1
	dvTP_LS_201			= 10201:4:1
	dvTP_H_201			= 10201:5:1

	dvTP_I_202			= 10202:1:1
	dvTP_V_202			= 10202:2:1
	dvTP_A_202			= 10202:3:1
	dvTP_LS_202			= 10202:4:1
	dvTP_H_202			= 10202:5:1

	dvTP_I_203			= 10203:1:1
	dvTP_V_203			= 10203:2:1
	dvTP_A_203			= 10203:3:1
	dvTP_LS_203			= 10203:4:1
	dvTP_H_203			= 10203:5:1

	dvTP_I_301			= 10301:1:1
	dvTP_V_301			= 10301:2:1
	dvTP_A_301			= 10301:3:1
	dvTP_LS_301			= 10301:4:1
	dvTP_H_301			= 10301:5:1

	dvTP_I_302			= 10302:1:1
	dvTP_V_302			= 10302:2:1
	dvTP_A_302			= 10302:3:1
	dvTP_LS_302			= 10302:4:1
	dvTP_H_302			= 10302:5:1

	dvTP_I_303			= 10303:1:1
	dvTP_V_303			= 10303:2:1
	dvTP_A_303			= 10303:3:1
	dvTP_LS_303			= 10303:4:1
	dvTP_H_303			= 10303:5:1

	dvTP_I_401			= 10401:1:1
	dvTP_V_401			= 10401:2:1
	dvTP_A_401			= 10401:3:1
	dvTP_LS_401			= 10401:4:1
	dvTP_H_401			= 10401:5:1

	dvTP_I_402			= 10402:1:1
	dvTP_V_402			= 10402:2:1
	dvTP_A_402			= 10402:3:1
	dvTP_LS_402			= 10402:4:1
	dvTP_H_402			= 10402:5:1

	dvTP_I_403			= 10403:1:1
	dvTP_V_403			= 10403:2:1
	dvTP_A_403			= 10403:3:1
	dvTP_LS_403			= 10403:4:1
	dvTP_H_403			= 10403:5:1

	//-----------------------------------------------------------------------------
	// Touch Panels Parties Communes-----------------------------------------------
	// One port for each controller Port 1 = System 1, Port 2 = System 2... -------
	//-----------------------------------------------------------------------------
	dvTP_iPad_0_Root			= 10050:1:1	//Root
	dvTP_iPad_1_Bien			= 10051:1:1	//Ipad Bien-Ãªtre
	dvTP_iPad_2_Shiseido		= 10052:1:1	//Ipad Shiseido	
	dvTP_iPad_3_Accueil			= 10053:1:1	//Ipad Accueil Pavillon	
	dvTP_iPad_4_Atelier			= 10054:1:1	//Ipad Atelier T. Marx	
	dvTP_iPad_5_SalonEiffel		= 10055:1:1	//Ipad Salon Eiffel	
	dvTP_iPad_6_SalonTronquois	= 10056:1:1	//Ipad Salon Tronquois	
	dvTP_iPad_7_Visions			= 10057:1:1	//Ipad Visions du Monde	
	dvTP_iPad_8_Surface			= 10058:1:1	//Interface supervision - Surface HT	
	dvTP_iPad_9_Super			= 10059:1:1	//Interface client iPhone / Android iPad supervision

	dvTP_iPad_Matrix			= 10050:3:1	//Audio Matrix


DEFINE_CONSTANT
	//-----------------------------------------------------------------------------
	// Touchpanels Rooms ----------------------------------------------------------
	//-----------------------------------------------------------------------------	
	EFFECTIVE_TP_NB_ROOMS 	= 10

	//-----------------------------------------------------------------------------
	// Touch Panels Parties Communes-----------------------------------------------
	//-----------------------------------------------------------------------------	
	EFFECTIVE_TP_NB_PC 	= 10	


DEFINE_VARIABLE

	//-----------------------------------------------------------------------------
	// Touch Panels FAKE ----------------------------------------------------------
	//-----------------------------------------------------------------------------
	CONSTANT DEV TPTabFake[1]

	//-----------------------------------------------------------------------------
	// Touch Panels Parties Communes-----------------------------------------------
	//-----------------------------------------------------------------------------
	CONSTANT DEV TPTabPC[EFFECTIVE_TP_NB_PC]  = 
	{
	dvTP_iPad_0_Root			,	//1 
	dvTP_iPad_1_Bien			,	//2
	dvTP_iPad_2_Shiseido		,	//3
	dvTP_iPad_3_Accueil			,	//4
	dvTP_iPad_4_Atelier			,	//5
	dvTP_iPad_5_SalonEiffel		,	//6
	dvTP_iPad_6_SalonTronquois	,	//7
	dvTP_iPad_7_Visions			,	//8
	dvTP_iPad_8_Surface			,	//9
	dvTP_iPad_9_Super		       	//10
	 
	}

	//-----------------------------------------------------------------------------
	// Touchpanels Rooms ----------------------------------------------------------
	//-----------------------------------------------------------------------------
	constant dev i_TPTabRooms[EFFECTIVE_TP_NB_ROOMS]  = {dvTP_I_200, dvTP_I_201, dvTP_I_202, dvTP_I_203, dvTP_I_301, dvTP_I_302, dvTP_I_303, dvTP_I_401, dvTP_I_402, dvTP_I_403}
	constant dev a_TPTabRooms[EFFECTIVE_TP_NB_ROOMS]  = {dvTP_A_200, dvTP_A_201, dvTP_A_202, dvTP_A_203, dvTP_A_301, dvTP_A_302, dvTP_A_303, dvTP_A_401, dvTP_A_402, dvTP_A_403}
	constant dev v_TPTabRooms[EFFECTIVE_TP_NB_ROOMS]  = {dvTP_V_200, dvTP_V_201, dvTP_V_202, dvTP_V_203, dvTP_V_301, dvTP_V_302, dvTP_V_303, dvTP_V_401, dvTP_V_402, dvTP_V_403}
	constant dev ls_TPTabRooms[EFFECTIVE_TP_NB_ROOMS] = {dvTP_LS_200, dvTP_LS_201, dvTP_LS_202, dvTP_LS_203, dvTP_LS_301, dvTP_LS_302, dvTP_LS_303, dvTP_LS_401, dvTP_LS_402, dvTP_LS_403}
	constant dev h_TPTabRooms[EFFECTIVE_TP_NB_ROOMS]  = {dvTP_H_200, dvTP_H_201, dvTP_H_202, dvTP_H_203, dvTP_H_301, dvTP_H_302, dvTP_H_303, dvTP_H_401, dvTP_H_402, dvTP_H_403}

	char isTPOnlineRooms[EFFECTIVE_TP_NB_ROOMS]