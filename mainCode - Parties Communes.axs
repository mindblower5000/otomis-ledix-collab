PROGRAM_NAME='_main'

#DEFINE COMPIL_ALARM_CLOCK 1

(***********************************************************)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 04/05/2006  AT: 09:00:25        *)
(***********************************************************)
(* System Type : NetLinx                                   *)
(***********************************************************)
(* REV HISTORY:                                            *)
(***********************************************************)
(*
    $History: $
*)
(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_DEVICE

	//-----------------------------------------------------------------------------
	// AMX Devices ----------------------------------------------------------------
	//-----------------------------------------------------------------------------	
	dvAMX 	= 0:1:1	//0:1:2
#WARN 'dvAMX = 0:1:2'	
	//-----------------------------------------------------------------------------
	// IP -------------------------------------------------------------------------
	//-----------------------------------------------------------------------------
	//Lutron QSX
	dvLutron				= 0:3:2
	vdvLutron				= 33203:1:2
	vdvDuetLutron			= 41003:1:2

	//BSS Soundweb BLU-806DA
	dvBSS					= 0:9:2
	vdvBSS					= 33209:1:2

	vdvBridge 				= 36002:1:1	//36002:1:2;  //message broadcasting
#WARN 'vdvBridge = 36002:1:2'	

	vdvTemp					= 33001:1:1	//33001:1:2	
#WARN 'vdvTemp = 33001:1:2'	
	
(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_CONSTANT

	//-----------------------------------------------------------------------------
	// Timelines ------------------------------------------------------------------
	//-----------------------------------------------------------------------------	
	TIMELINE_PROGRAM_MAIN 						= 54071
	TIMELINE_DEFINE_PROGRAM_LUTRON_CUSTOM 		= 54072
	TIMELINE_EVERY_MINUTE 						= 54073
	TIMELINE_BSS_QUEUE 							= 54074

	//-----------------------------------------------------------------------------
	// //View ACTIVITY index ------------------------------------------------------
	//-----------------------------------------------------------------------------
	
	CONSTANT INTEGER 	IND_CONTROL	= 1 						
	CONSTANT INTEGER 	IND_VIDEO	= 2 
	CONSTANT INTEGER 	IND_AUDIO 	= 3
	CONSTANT INTEGER 	IND_LIGHT	= 4 
	CONSTANT INTEGER 	IND_AC		= 5 
	CONSTANT INTEGER 	IND_MOTOR	= 6 
	CONSTANT INTEGER 	IND_VENT	= 7 

	CONSTANT CHAR ACTIVITYLIST[7][15] = {	'Control',			
											'Video',      		
											'Audio',       		
											'Lighting',         	
											'AC',         	
											'Motor',         	
											'Ventilation'}

	//-----------------------------------------------------------------------------
	// Lighting -------------------------------------------------------------------
	//-----------------------------------------------------------------------------
	LOAD_NB = 2
	ROOM_NB = 2

//-----------------------------------------------------------------------------
// Zones ---------------------------------------------------------------
//-----------------------------------------------------------------------------

	EFFECTIVE_NB_ZONES = 27

	EFFECTIVE_TP_NB = 10

	//ZONES
	//*Sous-sol									
	CONSTANT INTEGER 	Z_1__SS_Palier_es	= 1  //Palier escaliers
	CONSTANT INTEGER 	Z_2__SS_Vestiaire	= 2  //Vestiaires
	CONSTANT INTEGER 	Z_3__SS_Tisanerie	= 3  //Tisanerie
	CONSTANT INTEGER 	Z_4__SS_Bain_Japo	= 4  //Bain Japonais
	CONSTANT INTEGER 	Z_5__SS_Hammam___	= 5  //Hammam
	CONSTANT INTEGER 	Z_6__SS_Sauna____	= 6  //Sauna
	CONSTANT INTEGER 	Z_7__SS_Shiseido_	= 7  //Salle de Soins Shiseido
	CONSTANT INTEGER 	Z_8__SS_Douches_b	= 8  //Douches bambous
	CONSTANT INTEGER 	Z_9__SS_Douche_Sa	= 9  //Douche Sauna
	CONSTANT INTEGER 	Z_10_SS_WC_Espace	= 10 //WC Espace Bien-Ãªtre
	//*Rez-de-Chausse									
	CONSTANT INTEGER 	Z_11_R0_Accueil_P	= 11 //Accueil Pavillon
	CONSTANT INTEGER 	Z_12_R0_Grand_Sal	= 12 //Grand Salon
	CONSTANT INTEGER 	Z_13_R0_SalleAM__	= 13 //Salle Ã  manger
	CONSTANT INTEGER 	Z_14_R0_Restauran	= 14 //Restaurant
	CONSTANT INTEGER 	Z_15_R0_Atelier_d	= 15 //Atelier de Thierry Marx
	CONSTANT INTEGER 	Z_16_R0_Jardin___	= 16 //Jardin
	CONSTANT INTEGER 	Z_17_R0_Bar_ext__	= 17 //Bar extÃ©rieur
	CONSTANT INTEGER 	Z_18_R0_Palier_et	= 18 //Palier et Escaliers		
	//*Etage 1										
	CONSTANT INTEGER 	Z_19_R1_Salle_Eif	= 19 //Salle Eiffel
	CONSTANT INTEGER 	Z_20_R1_Salle_Tro	= 20 //Salle Tronquois
	CONSTANT INTEGER 	Z_21_R1_Sanitaire	= 21 //Sanitaires invitÃ©s
	CONSTANT INTEGER 	Z_22_R1_Pallier_e	= 22 //Pallier et Escaliers
	CONSTANT INTEGER 	Z_23_R1_Terrasse	= 23 //Terrasse
	CONSTANT INTEGER 	Z_24_R1_BureauMme	= 24 //Bureau Mme HervÃ©
	CONSTANT INTEGER 	Z_25_R1_Pallier_P	= 25 //Pallier Pavillon 1er Ã©tage
	//*Etage 5			 									
	CONSTANT INTEGER 	Z_26_R5_Visions_d	= 26 //Visions du monde 
	CONSTANT INTEGER 	Z_27_R5_Pigeonnie	= 27 //Pigeonnier			

	//*Etages 2, 3 et 4									
	//Chambres
	//Pallier et Escaliers

	/*
		Used in debug    
	*/
	CONSTANT CHAR FLOORLIST[7][30] = {
	'SS',			
	'R0',      		
	'R1',       		
	'R2',         	
	'R3',         	
	'R4',         	
	'R5'          	
	}



	/*
		Zones count in previous floor. Need for UI processing.
	*/
	CONSTANT INTEGER ETAGE_SHIFT[EFFECTIVE_NB_ZONES] = {
	0,		//SS
	10,     	//R0
	18,		//R1
	0,		//R2
	0,		//R3
	0,		//R4
	25		//R5
	}                 

	CONSTANT CHAR ZONELIST[EFFECTIVE_NB_ZONES][30] = {
	'Palier_SS',		//1 SS	Palier escaliers
	'Vestiaires',      	//2	Vestiaires
	'Tisanerie',       	//3	Tisanerie
	'BainJap',         	//4	Bain Japonais
	'Hammam',          	//5	Hammam
	'Sauna',           	//6	Sauna
	'Shiseido',        	//7	Salle de Soins Shiseido
	'Bambous',         	//8	Douches bambous
	'Douche',          	//9	Douche Sauna
	'WC',            	//10	WC Espace Bien-Ãªtre	
	'Pavillon',        	//11 RC Accueil Pavillon
	'Salon',           	//12	Grand Salon
	'SAM',             	//13	Salle Ã  manger
	'Restaurant',      	//14	Restaurant
	'Atelier',         	//15	Atelier de Thierry Marx
	'Jardin',          	//16	Jardin
	'Bar',             	//17	Bar extÃ©rieur
	'Palier_RDC',         	//18	Palier et Escaliers						
	'Eiffel',          	//19 R1	Salle Eiffel
	'Tronquois',       	//20	Salle Tronquois
	'Sanitaires',      	//21	Sanitaires invitÃ©s
	'Pallier_R1',        	//22	Pallier et Escaliers
	'Terrasse',        	//23	Terrasse
	'Bureau',          	//24	Bureau Mme HervÃ©
	'Pallier_Pav',       	//25	Pallier Pavillon 1er Ã©tage
	'Visions',         	//26 R5	Visions du monde 
	'Pigeonnier'		//27	Pigeonnier			
	}


	CONSTANT INTEGER ZONELIST_SHIFT[EFFECTIVE_NB_ZONES] = {
	0,		//1 SS	Palier escaliers
	0,     		//2	Vestiaires
	0,		//3	Tisanerie
	0,		//4	Bain Japonais
	0,		//5	Hammam
	0,		//6	Sauna
	0,		//7	Salle de Soins Shiseido
	0,		//8	Douches bambous
	0,		//9	Douche Sauna
	0,		//10	WC Espace Bien-Ãªtre	
	10,        	//11 RC Accueil Pavillon
	10,           	//12	Grand Salon
	10,             //13	Salle Ã  manger
	10,      	//14	Restaurant
	10,         	//15	Atelier de Thierry Marx
	10,          	//16	Jardin
	10,             //17	Bar extÃ©rieur
	10,         	//18	Palier et Escaliers						
	18,          	//19 R1	Salle Eiffel
	18,       	//20	Salle Tronquois
	18,      	//21	Sanitaires invitÃ©s
	18,        	//22	Pallier et Escaliers
	18,        	//23	Terrasse
	18,         	//24	Bureau Mme HervÃ©
	18,       	//25	Pallier Pavillon 1er Ã©tage
	25,         	//26 R5	Visions du monde 
	25		//27	Pigeonnier			
	}
	
	//-----------------------------------------------------------------------------
	// Audio zones ----------------------------------------------------------------
	//-----------------------------------------------------------------------------
	NB_ROOMS 	= 10

	NB_AUDIO_ZONES 		= 20
	NB_AUDIO_SOURCES 	= 18

	AUDIO_1 			= 1 
	AUDIO_2 			= 2 
	AUDIO_3 			= 3 
	AUDIO_4 			= 4 
	AUDIO_5 			= 5 
	AUDIO_6 			= 6 
	AUDIO_7 			= 7 
	AUDIO_8 			= 8 
	AUDIO_9 			= 9 
	AUDIO_10 			= 10
	AUDIO_11 			= 11
	AUDIO_12 			= 12
	AUDIO_13 			= 13
	AUDIO_14 			= 14
	AUDIO_15 			= 15
	AUDIO_16 			= 16
	AUDIO_17 			= 17
	AUDIO_18 			= 18
	AUDIO_19 			= 19
	AUDIO_20 			= 20
	AUDIO_21 			= 21	

	SOURCE_1			= 1
	SOURCE_2			= 2
	SOURCE_3			= 3
	SOURCE_4			= 4
	SOURCE_5			= 5
	SOURCE_6			= 6
	SOURCE_7			= 7
	SOURCE_8			= 8
	SOURCE_9			= 9
	SOURCE_10			= 10
	SOURCE_11			= 11
	SOURCE_12			= 12
	SOURCE_13			= 13
	SOURCE_14			= 14
	SOURCE_15			= 15
	SOURCE_16			= 16
	SOURCE_17			= 17
	SOURCE_18			= 18


DEFINE_TYPE

DEFINE_VARIABLE
	
	//-----------------------------------------------------------------------------
	// Timelines ------------------------------------------------------------------
	//-----------------------------------------------------------------------------	
	constant long DEFINE_PROGRAM_TIMES[1] 		= {300}
	constant long EVERY_MINUTE_TIMES[1] 		= {60000}
	CONSTANT LONG ALARM_CLOCKS_TIMES[1] 		= {60000}

	
	//-----------------------------------------------------------------------------
	// Channel codes --------------------------------------------------------------
	//-----------------------------------------------------------------------------	
	CONSTANT INTEGER i_ch_Volume[150]			= {201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350}
	CONSTANT INTEGER i_ch_LanguageSelector[3]	= {351,352,353} //fr,en,ru

	// Interfaces
	#IF_DEFINED COMPIL_ALARM_CLOCK
	CONSTANT INTEGER i_ch_AlarmClock[100]	= {	1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450,
												1451,1452,1453,1454,1455,1456,1457,1458,1459,1460,1461,1462,1463,1464,1465,1466,1467,1468,1469,1470,1471,1472,1473,1474,1475,1476,1477,1478,1479,1480,1481,1482,1483,1484,1485,1486,1487,1488,1489,1490,1491,1492,1493,1494,1495,1496,1497,1498,1499,1500}
	#END_IF

	// Audio
	CONSTANT INTEGER a_ch_AudioMatrix[400]			= {1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1147,1148,1149,1150,1151,1152,1153,1154,1155,1156,1157,1158,1159,1160,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1172,1173,1174,1175,1176,1177,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188,1189,1190,1191,1192,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1238,1239,1240,1241,1242,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,1254,1255,1256,1257,1258,1259,1260,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271,1272,1273,1274,1275,1276,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,1396,1397,1398,1399,1400}
	CONSTANT INTEGER a_ch_VolumeMatrix[10]			= {1501,1502,1503,1504,1505,1506,1507,1508,1509,1510}
	CONSTANT INTEGER a_ch_ZoneMatrix[30]			= {1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614,1615,1616,1617,1618,1619,1620,1621,1622,1623,1624,1625,1626,1627,1628,1629,1630}

	// Lighting
	CONSTANT INTEGER l_ch_LoadCommands[300]		= {101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400}
	CONSTANT INTEGER l_ch_RoomCommands[100]		= {401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500}
	CONSTANT INTEGER l_ch_Light[100]			= {501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600}

	
	//-----------------------------------------------------------------------------
	// Address codes --------------------------------------------------------------
	//-----------------------------------------------------------------------------
	CONSTANT INTEGER i_ad_ClosedVolume		= 205

	// Interfaces
	CONSTANT INTEGER i_a_clock					= 2	
	#IF_DEFINED COMPIL_ALARM_CLOCK
		CONSTANT INTEGER i_ad_AlarmClock[50] 		= {1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450}
		CONSTANT INTEGER i_ad_AlarmClockPlus[50] 	= {1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542,1543,1544,1545,1546,1547,1548,1549,1550}
		CONSTANT INTEGER i_ad_AlarmClockMoins[50] 	= {1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614,1615,1616,1617,1618,1619,1620,1621,1622,1623,1624,1625,1626,1627,1628,1629,1630,1631,1632,1633,1634,1635,1636,1637,1638,1639,1640,1641,1642,1643,1644,1645,1646,1647,1648,1649,1650}
	#END_IF
	
	
	//-----------------------------------------------------------------------------
	// Level codes ----------------------------------------------------------------
	//-----------------------------------------------------------------------------
	// Audio
	CONSTANT INTEGER a_l_VolumeMatrix			= 401

	//Lighting
	CONSTANT INTEGER l_l_LoadFeedback[100]		= {101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200}
	CONSTANT INTEGER l_l_LoadSlider[100]		= {401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500}

	//-----------------------------------------------------------------------------
	// Lutron QSX -----------------------------------------------------------------
	//-----------------------------------------------------------------------------
	VOLATILE CHAR lutronIP[] = '192.168.165.131'

	//-----------------------------------------------------------------------------
	// BSS ------------------------------------------------------------------------
	//-----------------------------------------------------------------------------
	CHAR ZoneSelected = 1
	CHAR BSSipAddress[15] = '192.168.165.135'
	

	//-----------------------------------------------------------------------------
	// Activities (tracking) ------------------------------------------------------
	//-----------------------------------------------------------------------------
	INTEGER nbZones = EFFECTIVE_NB_ZONES

	CHAR ZoneSourceSelectedVideo[EFFECTIVE_NB_ZONES][50] = 
	{
		'Off',  //Palier_SS',	
		'Off',  //Vestiaires',   
		'Off',  //Tisanerie',    
		'Off',  //BainJap',      
		'Off',  //Hammam',       
		'Off',  //Sauna',        
		'Off',  //Shiseido',     
		'Off',  //Bambous',      
		'Off',  //Douche',       
		'Off',  //WC',   
		
		'Off',  //Pavillon',                     
		'Off',  //Salon',        
		'Off',  //SAM',          
		'Off',  //Restaurant',   
		'Off',  //Atelier',      
		'Off',  //Jardin',       
		'Off',  //Bar',          
		'Off',  //Palier_RDC',   
		
		'Off',  //Eiffel',                       
		'Off',  //Tronquois',    
		'Off',  //Sanitaires',   
		'Off',  //Pallier_R1',   
		'Off',  //Terrasse',     
		'Off',  //Bureau',       
		'Off',  //Pallier_Pav',  
		'Off',  //Visions',      	        
		'Off'   //Pigeonnier'	
	}   				

	CHAR ZoneSourceSelectedAudio[EFFECTIVE_NB_ZONES][50] = 
	{
		'Off',  //Palier_SS',	
		'Off',  //Vestiaires',   
		'Off',  //Tisanerie',    
		'Off',  //BainJap',      
		'Off',  //Hammam',       
		'Off',  //Sauna',        
		'Off',  //Shiseido',     
		'Off',  //Bambous',      
		'Off',  //Douche',       
		'Off',  //WC',   
		
		'Off',  //Pavillon',                     
		'Off',  //Salon',        
		'Off',  //SAM',          
		'Off',  //Restaurant',   
		'Off',  //Atelier',      
		'Off',  //Jardin',       
		'Off',  //Bar',          
		'Off',  //Palier_RDC',   
		
		'Off',  //Eiffel',                       
		'Off',  //Tronquois',    
		'Off',  //Sanitaires',   
		'Off',  //Pallier_R1',   
		'Off',  //Terrasse',     
		'Off',  //Bureau',       
		'Off',  //Pallier_Pav',  
		'Off',  //Visions',      	        
		'Off'   //Pigeonnier'	
	}           	

	CHAR ZoneSourceLastVideo[EFFECTIVE_NB_ZONES][50] = 
	{
		//Also default start
		'Off',  //Palier_SS',	//AV NA
		'USB',  //Vestiaires',   
		'Off',  //Tisanerie',    	//AV NA
		'BS',  //BainJap',      
		'Off',  //Hammam',      	//AV NA 
		'Off',  //Sauna',       	//AV NA 
		'BS',  //Shiseido',     
		'Off',  //Bambous',      	//AV NA
		'Off',  //Douche',     	//AV NA  
		'Off',  //WC',   		//AV NA
		
		'BS',  //Pavillon',                     
		'BS',  //Salon',        
		'Off',  //SAM',         NA
		'Off',  //Restaurant',  NA 
		'USB',  //Atelier',      
		'Off',  //Jardin',   NA    
		'Off',  //Bar',     NA     
		'Off',  //Palier_RDC',   NA
		
		'BS',  //Eiffel',                       
		'BS',  //Tronquois',    
		'BS',  //Sanitaires',   
		'Off',  //Pallier_R1',   NA
		'Off',  //Terrasse',     NA
		'Off',  //Bureau',       NA
		'Off',  //Pallier_Pav',  NA
		'BS',  //Visions',     	        
		'Off'   //Pigeonnier'	NA
	}           	
	   

	CHAR ZoneSourceLastAudio[EFFECTIVE_NB_ZONES][50] = 
	{
		//Also default start
		'LeDix',  //Palier_SS',	//
		'LeDix',  //Vestiaires',   
		'LeDix',  //Tisanerie',    	//
		'LeDix',  //BainJap',      
		'LeDix',  //Hammam',      	// 
		'LeDix',  //Sauna',       	//
		'LeDix',  //Shiseido',     
		'LeDix',  //Bambous',      	//AV NA
		'LeDix',  //Douche',     	//AV NA  
		'LeDix',  //WC',   		//AV NA
		
		'LeDix',  //Pavillon',                     
		'LeDix',  //Salon',        
		'LeDix',  //SAM',      (?from Accueil Pavilion)    
		'LeDix',  //Restaurant',   (Salon)
		'LeDix',  //Atelier',      
		'LeDix',  //Jardin',       
		'LeDix',  //Bar',          
		'LeDix',  //Palier_RDC',   
		
		'LeDix',  //Eiffel',                       
		'LeDix',  //Tronquois',    
		'LeDix',  //Sanitaires',   
		'LeDix',  //Pallier_R1',   
		'LeDix',  //Terrasse',     
		'LeDix',  //Bureau',       
		'LeDix',  //Pallier_Pav',  
		'LeDix',  //Visions',      	        
		'LeDix'   //Pigeonnier'	
	}           	
	 



	CHAR lastZoneSelectedInTP[EFFECTIVE_TP_NB][30]
	CHAR lastActivitySelectedInTP[EFFECTIVE_TP_NB][30]



	INTEGER tp_online[100] //50 panels maximum, can be increased if needed

	CHAR zonesPopup[3][EFFECTIVE_TP_NB][50] = { //iPad/iPhone
		//fr
		{
		'FULL - PLAN - SS'		, //1 	dvTP_iPad_0_Root			
		'FULL - PLAN - SS'		, //2   dvTP_iPad_1_Bien		
		'FULL - PLAN - SS'		, //3   dvTP_iPad_2_Shiseido		
		'FULL - PLAN - SS'		, //4   dvTP_iPad_3_Accueil		
		'FULL - PLAN - SS'		, //5   dvTP_iPad_4_Atelier		
		'FULL - PLAN - SS'		, //6	dvTP_iPad_5_SalonEiffel		
		'FULL - PLAN - SS'		, //7   dvTP_iPad_6_SalonTronquois	
		'FULL - PLAN - SS'		, //8   dvTP_iPad_7_Visions		
		'FULL - PLAN - SS'		, //9   dvTP_iPad_8_Surface		
		'FULL - PLAN - SS'		 //10  dvTP_iPad_9_Super		
		
		},
		//en
		{
		'FULL - PLAN - SS'		, //1 	dvTP_iPad_0_Root			
		'FULL - PLAN - SS'		, //2   dvTP_iPad_1_Bien		
		'FULL - PLAN - SS'		, //3   dvTP_iPad_2_Shiseido		
		'FULL - PLAN - SS'		, //4   dvTP_iPad_3_Accueil		
		'FULL - PLAN - SS'		, //5   dvTP_iPad_4_Atelier		
		'FULL - PLAN - SS'		, //6	dvTP_iPad_5_SalonEiffel		
		'FULL - PLAN - SS'		, //7   dvTP_iPad_6_SalonTronquois	
		'FULL - PLAN - SS'		, //8   dvTP_iPad_7_Visions		
		'FULL - PLAN - SS'		, //9   dvTP_iPad_8_Surface		
		'FULL - PLAN - SS'		 //10  dvTP_iPad_9_Super		
		
		},
		//ru
		{
		'FULL - PLAN - SS'		, //1 	dvTP_iPad_0_Root			
		'FULL - PLAN - SS'		, //2   dvTP_iPad_1_Bien		
		'FULL - PLAN - SS'		, //3   dvTP_iPad_2_Shiseido		
		'FULL - PLAN - SS'		, //4   dvTP_iPad_3_Accueil		
		'FULL - PLAN - SS'		, //5   dvTP_iPad_4_Atelier		
		'FULL - PLAN - SS'		, //6	dvTP_iPad_5_SalonEiffel		
		'FULL - PLAN - SS'		, //7   dvTP_iPad_6_SalonTronquois	
		'FULL - PLAN - SS'		, //8   dvTP_iPad_7_Visions		
		'FULL - PLAN - SS'		, //9   dvTP_iPad_8_Surface		
		'FULL - PLAN - SS'		 //10  dvTP_iPad_9_Super				
		
		}
    }        



 
	CHAR FHCActPopup[3][EFFECTIVE_TP_NB][50] = { //Not used
		//fr
		{
		'MNU - SS - Plan', //1 		dvTP_iPad_0_Root		
		'MNU - SS - Plan', //2       	dvTP_iPad_1_Bien		
		'MNU - SS - Plan', //3       	dvTP_iPad_2_Shiseido		
		'MNU - SS - Plan', //4       	dvTP_iPad_3_Accueil		
		'MNU - SS - Plan', //5       	dvTP_iPad_4_Atelier		
		'MNU - SS - Plan', //6       	dvTP_iPad_5_SalonEiffel		
		'MNU - SS - Plan', //7       	dvTP_iPad_6_SalonTronquois	
		'MNU - SS - Plan', //8       	dvTP_iPad_7_Visions		
		'MNU - SS - Plan', //9       	dvTP_iPad_8_Surface		
		'MNU - SS - Plan' //10      	dvTP_iPad_9_Super		
		
		},
		//en
		{
		'MNU - SS - Plan', //1 	dvTP_iPad_0_Root		
		'MNU - SS - Plan', //2      	dvTP_iPad_1_Bien		
		'MNU - SS - Plan', //3      	dvTP_iPad_2_Shiseido		
		'MNU - SS - Plan', //4      	dvTP_iPad_3_Accueil		
		'MNU - SS - Plan', //5      	dvTP_iPad_4_Atelier		
		'MNU - SS - Plan', //6      	dvTP_iPad_5_SalonEiffel		
		'MNU - SS - Plan', //7      	dvTP_iPad_6_SalonTronquois	
		'MNU - SS - Plan', //8      	dvTP_iPad_7_Visions		
		'MNU - SS - Plan', //9      	dvTP_iPad_8_Surface		
		'MNU - SS - Plan' //10      	dvTP_iPad_9_Super		
		
		},
		//ru
		{
		'MNU - SS - Plan', //1 	dvTP_iPad_0_Root		
		'MNU - SS - Plan', //2       	dvTP_iPad_1_Bien		
		'MNU - SS - Plan', //3       	dvTP_iPad_2_Shiseido		
		'MNU - SS - Plan', //4       	dvTP_iPad_3_Accueil		
		'MNU - SS - Plan', //5       	dvTP_iPad_4_Atelier		
		'MNU - SS - Plan', //6       	dvTP_iPad_5_SalonEiffel		
		'MNU - SS - Plan', //7       	dvTP_iPad_6_SalonTronquois	
		'MNU - SS - Plan', //8       	dvTP_iPad_7_Visions		
		'MNU - SS - Plan', //9       	dvTP_iPad_8_Surface		
		'MNU - SS - Plan' //10       	dvTP_iPad_9_Super	  	
		
		}	
    }        
 
	CHAR isTPOnline[22] = {
	FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE }

	CHAR appLanguage[3][2] = {'fr','en','ru'}

	VOLATILE CHAR currTPLanguage[11] =  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}


	//-----------------------------------------------------------------------------
	// Includes -------------------------------------------------------------------
	//-----------------------------------------------------------------------------

	#INCLUDE 'TPs'
	#include 'common_master_code'
	#include '_utils'
	#INCLUDE '_utils2'
	#include 'UnicodeLib'
	#INCLUDE 'Lutron_Custom_PC'	
	#INCLUDE 'BSSControl'
	#INCLUDE 'ViewModel'

//DEFINE_MODULE 'Otomis_Eona' 		EonaServer	(vdvEona, dvEona, v_TPTab, v_ch_TV, EonaIP, TerminalsIP, TerminalsPower, TerminalsActivity, TerminalsChannel, start_delay)
//DEFINE_MODULE 'Otomis_Bose_comm'	BoseChambre	(vdvBose, dvBose, BoseChambreIP, BoseChambreZones, BoseChambreOutput, BoseChambreVolume, BoseChambreMute, BoseChambrePowerOffInput)
DEFINE_MODULE 'Otomis_LutronQSX_ui' uiLutron 	(vdvLutron, TPTabFake, l_ch_LoadCommands, l_l_LoadFeedback, l_l_LoadSlider, l_ch_RoomCommands)
#WARN 'Module Otomis_LutronQSX_comm: IF NOT PAIRED, THE COMM MODULE LOCKED FOR 15MIN AMX PROCESSOR AFTER REBOOT <<<<<<<<<<<<<<<<<<<<<'
/*
•	The module is not supported on NI masters
•	The firmware required is 1.6 with minimum patch version as 201 (v1.6.201)
•	The firmware 1.7.xxx and 1.8.xxx are currently not supported
*/
//DEFINE_MODULE 'Otomis_LutronQSX_comm' commLutron 		(dvLutron, vdvLutron, vdvDuetLutron, lutronIP)                                                                                 
#WARN 'MODULE LUTRON QS COMMENTED  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
DEFINE_MODULE 'Otomis_iPad'       iPad_0_Root		(dvTP_iPad_0_Root		,isTPOnline[ 1],  nbZones, ZONELIST, lastZoneSelectedInTP[ 1],   lastActivitySelectedInTP[ 1], zonesPopup[currTPLanguage[ 1]][ 1],   FHCActPopup[currTPLanguage[ 1]][ 1], appLanguage[currTPLanguage[ 1]], HOLD_TIMER[1])
DEFINE_MODULE 'Otomis_iPad'       iPad_1_Bien		(dvTP_iPad_1_Bien		,isTPOnline[ 2],  nbZones, ZONELIST, lastZoneSelectedInTP[ 2],   lastActivitySelectedInTP[ 2], zonesPopup[currTPLanguage[ 2]][ 2],   FHCActPopup[currTPLanguage[ 2]][ 2], appLanguage[currTPLanguage[ 2]], HOLD_TIMER[2])		
DEFINE_MODULE 'Otomis_iPad'       iPad_2_Shiseido	(dvTP_iPad_2_Shiseido		,isTPOnline[ 3],  nbZones, ZONELIST, lastZoneSelectedInTP[ 3],   lastActivitySelectedInTP[ 3], zonesPopup[currTPLanguage[ 3]][ 3],   FHCActPopup[currTPLanguage[ 3]][ 3], appLanguage[currTPLanguage[ 3]], HOLD_TIMER[3]) 
DEFINE_MODULE 'Otomis_iPad'       iPad_3_Accueil	(dvTP_iPad_3_Accueil		,isTPOnline[ 4],  nbZones, ZONELIST, lastZoneSelectedInTP[ 4],   lastActivitySelectedInTP[ 4], zonesPopup[currTPLanguage[ 4]][ 4],   FHCActPopup[currTPLanguage[ 4]][ 4], appLanguage[currTPLanguage[ 4]], HOLD_TIMER[4])
DEFINE_MODULE 'Otomis_iPad'       iPad_4_Atelier	(dvTP_iPad_4_Atelier		,isTPOnline[ 5],  nbZones, ZONELIST, lastZoneSelectedInTP[ 5],   lastActivitySelectedInTP[ 5], zonesPopup[currTPLanguage[ 5]][ 5],   FHCActPopup[currTPLanguage[ 5]][ 5], appLanguage[currTPLanguage[ 5]], HOLD_TIMER[5])
DEFINE_MODULE 'Otomis_iPad'       iPad_5_SalonEiffel	(dvTP_iPad_5_SalonEiffel	,isTPOnline[ 6],  nbZones, ZONELIST, lastZoneSelectedInTP[ 6],   lastActivitySelectedInTP[ 6], zonesPopup[currTPLanguage[ 6]][ 6],   FHCActPopup[currTPLanguage[ 6]][ 6], appLanguage[currTPLanguage[ 6]], HOLD_TIMER[6])		
DEFINE_MODULE 'Otomis_iPad'       iPad_6_SalonTronquois	(dvTP_iPad_6_SalonTronquois	,isTPOnline[ 7],  nbZones, ZONELIST, lastZoneSelectedInTP[ 7],   lastActivitySelectedInTP[ 7], zonesPopup[currTPLanguage[ 7]][ 7],   FHCActPopup[currTPLanguage[ 7]][ 7], appLanguage[currTPLanguage[ 7]], HOLD_TIMER[7]) 
DEFINE_MODULE 'Otomis_iPad'       iPad_7_Visions	(dvTP_iPad_7_Visions		,isTPOnline[ 8],  nbZones, ZONELIST, lastZoneSelectedInTP[ 8],   lastActivitySelectedInTP[ 8], zonesPopup[currTPLanguage[ 8]][ 8],   FHCActPopup[currTPLanguage[ 8]][ 8], appLanguage[currTPLanguage[ 8]], HOLD_TIMER[8])
DEFINE_MODULE 'Otomis_iPad'       iPad_8_Surface	(dvTP_iPad_8_Surface		,isTPOnline[ 9],  nbZones, ZONELIST, lastZoneSelectedInTP[ 9],   lastActivitySelectedInTP[ 9], zonesPopup[currTPLanguage[ 9]][ 9],   FHCActPopup[currTPLanguage[ 9]][ 9], appLanguage[currTPLanguage[ 9]], HOLD_TIMER[9])
DEFINE_MODULE 'Otomis_iPad'       iPad_9_Super	  	(dvTP_iPad_9_Super	  	,isTPOnline[10],  nbZones, ZONELIST, lastZoneSelectedInTP[10],   lastActivitySelectedInTP[10], zonesPopup[currTPLanguage[10]][10],   FHCActPopup[currTPLanguage[10]][10], appLanguage[currTPLanguage[10]], HOLD_TIMER[10])		
DEFINE_FUNCTION setMute(CHAR zone, CHAR state)
{
	IF (zoneMute[zone] <> state)
	{
		bssSetValue  (dvBSS, bssMuteAddresses[zone], state);
		bssSubscribe (dvBSS, bssMuteAddresses[zone]);
	}
}	
DEFINE_FUNCTION debug(INTEGER logLevel, CHAR message[])
{
	AMX_LOG(logLevel, "'Main - ', message")
}	




DEFINE_FUNCTION Scene(DEV dvTP, CHAR zone[], CHAR sceneName[], INTEGER etage, INTEGER act_index)
{
	LOCAL_VAR DEV lvTP
	lvTP = dvTP


	//debug(AMX_DEBUG, "'SCENE - ZONE[',zone,'] cmd: ', sceneName")


	SWITCH (zone)
	{
	
//-----------------------------------------------------------------------------
// SMART OFF as SCE@Off from iPhone. It is useful for ATV universal top used for all rooms
//-----------------------------------------------------------------------------
		CASE 'Off':
		{
			Scene(lvTP, lastZoneSelectedInTP[TPNumberPC(dvTP)], 'Off',0,0)			
		}
//-----------------------------------------------------------------------------
// Global ---------------------------------------------------------------------
//-----------------------------------------------------------------------------
		CASE 'Global':
		{
			SWITCH (sceneName)
			{
			
				CASE 'All Off':
				{

				}

			}
		}

//-----------------------------------------------------------------------------
//SS	 ----------------------------------------------------------------
//-----------------------------------------------------------------------------
		CASE 'Palier_SS':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_1__SS_Palier_es] = 'Off'
				    ZoneSourceSelectedVideo[Z_1__SS_Palier_es] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}
		
		CASE 'Vestiaires':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_2__SS_Vestiaire] = 'Off'
				    ZoneSourceSelectedVideo[Z_2__SS_Vestiaire] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}
		
		CASE 'Tisanerie':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_3__SS_Tisanerie] = 'Off'
				    ZoneSourceSelectedVideo[Z_3__SS_Tisanerie] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}

		
		CASE 'BainJap':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_4__SS_Bain_Japo] = 'Off'
					ZoneSourceSelectedVideo[Z_4__SS_Bain_Japo] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
				CASE 'Audio Off':
				{				    
				    ZoneSourceSelectedAudio[Z_4__SS_Bain_Japo] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
				CASE 'Video Off':
				{				    
					ZoneSourceSelectedVideo[Z_4__SS_Bain_Japo] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}
        
		CASE 'Hammam':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_5__SS_Hammam___] = 'Off'
				    ZoneSourceSelectedVideo[Z_5__SS_Hammam___] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}
        
 
		CASE 'Sauna':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_6__SS_Sauna____] = 'Off'
				    ZoneSourceSelectedVideo[Z_6__SS_Sauna____] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}
        
 

		CASE 'Shiseido':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_7__SS_Shiseido_] = 'Off'
				    ZoneSourceSelectedVideo[Z_7__SS_Shiseido_] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
				CASE 'Audio Off':
				{				    
				    ZoneSourceSelectedAudio[Z_7__SS_Shiseido_] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
				CASE 'Video Off':
				{				    
				    ZoneSourceSelectedVideo[Z_7__SS_Shiseido_] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}
                

		CASE 'Bambous':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_8__SS_Douches_b] = 'Off'
				    ZoneSourceSelectedVideo[Z_8__SS_Douches_b] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}


		CASE 'Douche':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_9__SS_Douche_Sa] = 'Off'
				    ZoneSourceSelectedVideo[Z_9__SS_Douche_Sa] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}

		CASE 'WC':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_10_SS_WC_Espace] = 'Off'
				    ZoneSourceSelectedVideo[Z_10_SS_WC_Espace] = 'Off'

				    WAIT 2 UpdateViewState(Etage_SS)
				}
			}
		}
 // RDC -----------------------------------------------------------------------      
		CASE 'Pavillon':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_11_R0_Accueil_P] = 'Off'
				    ZoneSourceSelectedVideo[Z_11_R0_Accueil_P] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
				CASE 'Audio Off':
				{				    
				    ZoneSourceSelectedAudio[Z_11_R0_Accueil_P] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
				CASE 'Video Off':
				{				    
				    ZoneSourceSelectedVideo[Z_11_R0_Accueil_P] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
			}
		}
                        				
		CASE 'Salon':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_12_R0_Grand_Sal] = 'Off'
				    ZoneSourceSelectedVideo[Z_12_R0_Grand_Sal] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
				CASE 'Audio Off':
				{				    
				    ZoneSourceSelectedAudio[Z_12_R0_Grand_Sal] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
				CASE 'Video Off':
				{				    
				    ZoneSourceSelectedVideo[Z_12_R0_Grand_Sal] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
			}
		}
    
		CASE 'SAM':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_13_R0_SalleAM__] = 'Off'
				    ZoneSourceSelectedVideo[Z_13_R0_SalleAM__] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
			}
		}
    
		CASE 'Restaurant':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_14_R0_Restauran] = 'Off'
				    ZoneSourceSelectedVideo[Z_14_R0_Restauran] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
			}
		}
                                    
		CASE 'Atelier':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_15_R0_Atelier_d] = 'Off'
				    ZoneSourceSelectedVideo[Z_15_R0_Atelier_d] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
				CASE 'Audio Off':
				{				    
				    ZoneSourceSelectedAudio[Z_15_R0_Atelier_d] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
				CASE 'Video Off':
				{				    
				    ZoneSourceSelectedVideo[Z_15_R0_Atelier_d] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
			}
		}
		
		CASE 'Jardin':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_16_R0_Jardin___] = 'Off'
				    ZoneSourceSelectedVideo[Z_16_R0_Jardin___] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
			}
		}
		
		CASE 'Bar':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_17_R0_Bar_ext__] = 'Off'
				    ZoneSourceSelectedVideo[Z_17_R0_Bar_ext__] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
			}
		}
		
		CASE 'Palier_RDC':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_18_R0_Palier_et] = 'Off'
				    ZoneSourceSelectedVideo[Z_18_R0_Palier_et] = 'Off'

				    WAIT 2 UpdateViewState(Etage_RDC)
				}
			}
		}
                 
// R1 --------------------------------------------------------------------
		CASE 'Eiffel':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_19_R1_Salle_Eif] = 'Off'
				    ZoneSourceSelectedVideo[Z_19_R1_Salle_Eif] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
				CASE 'Audio Off':
				{				    
				    ZoneSourceSelectedAudio[Z_19_R1_Salle_Eif] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
				CASE 'Video Off':
				{				    
				    ZoneSourceSelectedVideo[Z_19_R1_Salle_Eif] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
			}
		}
                 
		CASE 'Tronquois':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_20_R1_Salle_Tro] = 'Off'
				    ZoneSourceSelectedVideo[Z_20_R1_Salle_Tro] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
				CASE 'Audio Off':
				{				    
				    ZoneSourceSelectedAudio[Z_20_R1_Salle_Tro] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
				CASE 'Video Off':
				{				    
				    ZoneSourceSelectedVideo[Z_20_R1_Salle_Tro] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
			}
		}
				
		CASE 'Sanitaires':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_21_R1_Sanitaire] = 'Off'
				    ZoneSourceSelectedVideo[Z_21_R1_Sanitaire] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
			}
		}
                 					
		CASE 'Pallier_R1':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_22_R1_Pallier_e] = 'Off'
				    ZoneSourceSelectedVideo[Z_22_R1_Pallier_e] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
			}
		}

		CASE 'Terrasse':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_23_R1_Terrasse] = 'Off'
				    ZoneSourceSelectedVideo[Z_23_R1_Terrasse] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
			}
		}
				
		CASE 'Bureau':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_24_R1_BureauMme] = 'Off'
				    ZoneSourceSelectedVideo[Z_24_R1_BureauMme] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
			}
		}
					    
				
		CASE 'Pallier_Pav':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_25_R1_Pallier_P] = 'Off'
				    ZoneSourceSelectedVideo[Z_25_R1_Pallier_P] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R1)
				}
			}
		}
// R5 --------------------------------------------------------------------------							
		CASE 'Visions':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_26_R5_Visions_d] = 'Off'
				    ZoneSourceSelectedVideo[Z_26_R5_Visions_d] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R5)
				}
				CASE 'Audio Off':
				{				    
				    ZoneSourceSelectedAudio[Z_26_R5_Visions_d] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R5)
				}
				CASE 'Video Off':
				{				    
				    ZoneSourceSelectedVideo[Z_26_R5_Visions_d] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R5)
				}
			}
		}

							
		CASE 'Pigeonnier':
		{
			SWITCH (sceneName)
			{
				CASE 'Off':
				{				    
				    ZoneSourceSelectedAudio[Z_27_R5_Pigeonnie] = 'Off'
				    ZoneSourceSelectedVideo[Z_27_R5_Pigeonnie] = 'Off'

				    WAIT 2 UpdateViewState(Etage_R5)
				}
			}
		}
	}
}




DEFINE_FUNCTION Audio(DEV dvTP, CHAR zone[], CHAR audioName[50],INTEGER etage, INTEGER act_index)
{
	LOCAL_VAR DEV lvTP
	lvTP = dvTP //used to retain the last tp
	
	
	//IF(audioName<>'Party' || audioName<>'PartyM') 
	//    SEND_COMMAND dvTP, "'^TXT-', ITOA(I_A_AV_TOP), ',0,', audioName"

	
	
	SWITCH (zone)
	{

// SS -----------------------------------------------------------------------------
	
		CASE 'Palier_SS':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_1__SS_Palier_es] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_1__SS_Palier_es]
			
			
			IF (ZoneSourceSelectedAudio[Z_1__SS_Palier_es] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_1__SS_Palier_es] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_1__SS_Palier_es] = audioName
					ZoneSourceLastAudio	[Z_1__SS_Palier_es] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_1__SS_Palier_es] = audioName
					ZoneSourceLastAudio	[Z_1__SS_Palier_es] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_1__SS_Palier_es] = audioName
					ZoneSourceLastAudio	[Z_1__SS_Palier_es] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_1__SS_Palier_es] = audioName
					ZoneSourceLastAudio	[Z_1__SS_Palier_es] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					   	    
				}
			}
		}
	
	
	
		CASE 'Vestiaires':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_2__SS_Vestiaire] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_2__SS_Vestiaire]
			
			
			IF (ZoneSourceSelectedAudio[Z_2__SS_Vestiaire] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_2__SS_Vestiaire] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_2__SS_Vestiaire] = audioName
					ZoneSourceLastAudio	[Z_2__SS_Vestiaire] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_2__SS_Vestiaire] = audioName
					ZoneSourceLastAudio	[Z_2__SS_Vestiaire] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_2__SS_Vestiaire] = audioName
					ZoneSourceLastAudio	[Z_2__SS_Vestiaire] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_2__SS_Vestiaire] = audioName
					ZoneSourceLastAudio	[Z_2__SS_Vestiaire] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					   
					    
				}
			}
		}
	

    
		CASE 'Tisanerie':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_3__SS_Tisanerie] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_3__SS_Tisanerie]
			
			
			IF (ZoneSourceSelectedAudio[Z_3__SS_Tisanerie] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_3__SS_Tisanerie] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_3__SS_Tisanerie] = audioName
					ZoneSourceLastAudio	[Z_3__SS_Tisanerie] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_3__SS_Tisanerie] = audioName
					ZoneSourceLastAudio	[Z_3__SS_Tisanerie] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_3__SS_Tisanerie] = audioName
					ZoneSourceLastAudio	[Z_3__SS_Tisanerie] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_3__SS_Tisanerie] = audioName
					ZoneSourceLastAudio	[Z_3__SS_Tisanerie] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_3__SS_Tisanerie] = audioName
					ZoneSourceLastAudio	[Z_3__SS_Tisanerie] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					    
				    
					    
				}
			}
		}
	 
		CASE 'BainJap':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_4__SS_Bain_Japo] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Audio Off',etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_4__SS_Bain_Japo]
			
			
			IF (ZoneSourceSelectedAudio[Z_4__SS_Bain_Japo] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_4__SS_Bain_Japo] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_4__SS_Bain_Japo] = audioName
					ZoneSourceLastAudio	[Z_4__SS_Bain_Japo] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_4__SS_Bain_Japo] = audioName
					ZoneSourceLastAudio	[Z_4__SS_Bain_Japo] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_4__SS_Bain_Japo] = audioName
					ZoneSourceLastAudio	[Z_4__SS_Bain_Japo] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_4__SS_Bain_Japo] = audioName
					ZoneSourceLastAudio	[Z_4__SS_Bain_Japo] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_4__SS_Bain_Japo] = audioName
					ZoneSourceLastAudio	[Z_4__SS_Bain_Japo] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					    
				    

				    CASE 'Ecran':  
				    {         
					ZoneSourceSelectedAudio	[Z_4__SS_Bain_Japo] = audioName
					ZoneSourceLastAudio	[Z_4__SS_Bain_Japo] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					    
							    
				}
			}
		}
	  
		CASE 'Hammam':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_5__SS_Hammam___] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_5__SS_Hammam___]
			
			
			IF (ZoneSourceSelectedAudio[Z_5__SS_Hammam___] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_5__SS_Hammam___] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_5__SS_Hammam___] = audioName
					ZoneSourceLastAudio	[Z_5__SS_Hammam___] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_5__SS_Hammam___] = audioName
					ZoneSourceLastAudio	[Z_5__SS_Hammam___] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_5__SS_Hammam___] = audioName
					ZoneSourceLastAudio	[Z_5__SS_Hammam___] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_5__SS_Hammam___] = audioName
					ZoneSourceLastAudio	[Z_5__SS_Hammam___] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_5__SS_Hammam___] = audioName
					ZoneSourceLastAudio	[Z_5__SS_Hammam___] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					    
				    		    
				}
			}
		}
  
		CASE 'Sauna':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_6__SS_Sauna____] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_6__SS_Sauna____]
			
			
			IF (ZoneSourceSelectedAudio[Z_6__SS_Sauna____] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_6__SS_Sauna____] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_6__SS_Sauna____] = audioName
					ZoneSourceLastAudio	[Z_6__SS_Sauna____] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_6__SS_Sauna____] = audioName
					ZoneSourceLastAudio	[Z_6__SS_Sauna____] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_6__SS_Sauna____] = audioName
					ZoneSourceLastAudio	[Z_6__SS_Sauna____] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_6__SS_Sauna____] = audioName
					ZoneSourceLastAudio	[Z_6__SS_Sauna____] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_6__SS_Sauna____] = audioName
					ZoneSourceLastAudio	[Z_6__SS_Sauna____] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					    
				    		    
				}
			}
		}
	


		CASE 'Shiseido':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_7__SS_Shiseido_] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Audio Off',etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_7__SS_Shiseido_]
			
			
			IF (ZoneSourceSelectedAudio[Z_7__SS_Shiseido_] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_7__SS_Shiseido_] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_7__SS_Shiseido_] = audioName
					ZoneSourceLastAudio	[Z_7__SS_Shiseido_] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_7__SS_Shiseido_] = audioName
					ZoneSourceLastAudio	[Z_7__SS_Shiseido_] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'BSAudio':  
				    {         
					ZoneSourceSelectedAudio	[Z_7__SS_Shiseido_] = audioName
					ZoneSourceLastAudio	[Z_7__SS_Shiseido_] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'PCAudio':  
				    {         
					ZoneSourceSelectedAudio	[Z_7__SS_Shiseido_] = audioName
					ZoneSourceLastAudio	[Z_7__SS_Shiseido_] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_7__SS_Shiseido_] = audioName
					ZoneSourceLastAudio	[Z_7__SS_Shiseido_] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					    
				    
				    CASE 'RCA':  
				    {         
					ZoneSourceSelectedAudio	[Z_7__SS_Shiseido_] = audioName
					ZoneSourceLastAudio	[Z_7__SS_Shiseido_] = audioName
				    
					UpdateViewState(Etage_SS)
				    }					    
				}
			}
		}
//RDC -----------------------------------------------------------------------------
		CASE 'Pavillon':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_11_R0_Accueil_P] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Audio Off',etage, act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_11_R0_Accueil_P]
			
			
			IF (ZoneSourceSelectedAudio[Z_11_R0_Accueil_P] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_11_R0_Accueil_P] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_11_R0_Accueil_P] = audioName
					ZoneSourceLastAudio	[Z_11_R0_Accueil_P] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_11_R0_Accueil_P] = audioName
					ZoneSourceLastAudio	[Z_11_R0_Accueil_P] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_11_R0_Accueil_P] = audioName
					ZoneSourceLastAudio	[Z_11_R0_Accueil_P] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_11_R0_Accueil_P] = audioName
					ZoneSourceLastAudio	[Z_11_R0_Accueil_P] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_11_R0_Accueil_P] = audioName
					ZoneSourceLastAudio	[Z_11_R0_Accueil_P] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    

				    CASE 'Ecran':  
				    {         
					ZoneSourceSelectedAudio	[Z_11_R0_Accueil_P] = audioName
					ZoneSourceLastAudio	[Z_11_R0_Accueil_P] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
				    	
				    CASE 'TV':  
				    {         
					ZoneSourceSelectedAudio	[Z_11_R0_Accueil_P] = audioName
					ZoneSourceLastAudio	[Z_11_R0_Accueil_P] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
				    						
				}
			}
		}
  
	   
		CASE 'Salon':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_12_R0_Grand_Sal] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Audio Off',etage, act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_12_R0_Grand_Sal]
			
			
			IF (ZoneSourceSelectedAudio[Z_12_R0_Grand_Sal] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_12_R0_Grand_Sal] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_12_R0_Grand_Sal] = audioName
					ZoneSourceLastAudio	[Z_12_R0_Grand_Sal] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_12_R0_Grand_Sal] = audioName
					ZoneSourceLastAudio	[Z_12_R0_Grand_Sal] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_12_R0_Grand_Sal] = audioName
					ZoneSourceLastAudio	[Z_12_R0_Grand_Sal] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_12_R0_Grand_Sal] = audioName
					ZoneSourceLastAudio	[Z_12_R0_Grand_Sal] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_12_R0_Grand_Sal] = audioName
					ZoneSourceLastAudio	[Z_12_R0_Grand_Sal] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    

				    CASE 'Ecran':  
				    {         
					ZoneSourceSelectedAudio	[Z_12_R0_Grand_Sal] = audioName
					ZoneSourceLastAudio	[Z_12_R0_Grand_Sal] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
				    	
				    CASE 'TV':  
				    {         
					ZoneSourceSelectedAudio	[Z_12_R0_Grand_Sal] = audioName
					ZoneSourceLastAudio	[Z_12_R0_Grand_Sal] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
				    						
				}
			}
		}
   
		CASE 'SAM':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_13_R0_SalleAM__] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_13_R0_SalleAM__]
			
			
			IF (ZoneSourceSelectedAudio[Z_13_R0_SalleAM__] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_13_R0_SalleAM__] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_13_R0_SalleAM__] = audioName
					ZoneSourceLastAudio	[Z_13_R0_SalleAM__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_13_R0_SalleAM__] = audioName
					ZoneSourceLastAudio	[Z_13_R0_SalleAM__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_13_R0_SalleAM__] = audioName
					ZoneSourceLastAudio	[Z_13_R0_SalleAM__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_13_R0_SalleAM__] = audioName
					ZoneSourceLastAudio	[Z_13_R0_SalleAM__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_13_R0_SalleAM__] = audioName
					ZoneSourceLastAudio	[Z_13_R0_SalleAM__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    

				    CASE 'Ecran':  
				    {         
					ZoneSourceSelectedAudio	[Z_13_R0_SalleAM__] = audioName
					ZoneSourceLastAudio	[Z_13_R0_SalleAM__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
				    	
				    CASE 'TV':  
				    {         
					ZoneSourceSelectedAudio	[Z_13_R0_SalleAM__] = audioName
					ZoneSourceLastAudio	[Z_13_R0_SalleAM__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
				    						
				}
			}
		}

   
		CASE 'Restaurant':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_14_R0_Restauran] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_14_R0_Restauran]
			
			
			IF (ZoneSourceSelectedAudio[Z_14_R0_Restauran] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_14_R0_Restauran] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_14_R0_Restauran] = audioName
					ZoneSourceLastAudio	[Z_14_R0_Restauran] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_14_R0_Restauran] = audioName
					ZoneSourceLastAudio	[Z_14_R0_Restauran] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_14_R0_Restauran] = audioName
					ZoneSourceLastAudio	[Z_14_R0_Restauran] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_14_R0_Restauran] = audioName
					ZoneSourceLastAudio	[Z_14_R0_Restauran] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_14_R0_Restauran] = audioName
					ZoneSourceLastAudio	[Z_14_R0_Restauran] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
	
				    CASE 'TV':  
				    {         
					ZoneSourceSelectedAudio	[Z_14_R0_Restauran] = audioName
					ZoneSourceLastAudio	[Z_14_R0_Restauran] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
				    						
				}
			}
		}
  
		CASE 'Atelier':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_15_R0_Atelier_d] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Audio Off',etage, act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_15_R0_Atelier_d]
			
			
			IF (ZoneSourceSelectedAudio[Z_15_R0_Atelier_d] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_15_R0_Atelier_d] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_15_R0_Atelier_d] = audioName
					ZoneSourceLastAudio	[Z_15_R0_Atelier_d] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_15_R0_Atelier_d] = audioName
					ZoneSourceLastAudio	[Z_15_R0_Atelier_d] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_15_R0_Atelier_d] = audioName
					ZoneSourceLastAudio	[Z_15_R0_Atelier_d] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_15_R0_Atelier_d] = audioName
					ZoneSourceLastAudio	[Z_15_R0_Atelier_d] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_15_R0_Atelier_d] = audioName
					ZoneSourceLastAudio	[Z_15_R0_Atelier_d] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
	
				    CASE 'TV':  
				    {         
					ZoneSourceSelectedAudio	[Z_15_R0_Atelier_d] = audioName
					ZoneSourceLastAudio	[Z_15_R0_Atelier_d] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
				    						
				}
			}
		}
  

		CASE 'Jardin':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_16_R0_Jardin___] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_16_R0_Jardin___]
			
			
			IF (ZoneSourceSelectedAudio[Z_16_R0_Jardin___] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_16_R0_Jardin___] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_16_R0_Jardin___] = audioName
					ZoneSourceLastAudio	[Z_16_R0_Jardin___] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_16_R0_Jardin___] = audioName
					ZoneSourceLastAudio	[Z_16_R0_Jardin___] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_16_R0_Jardin___] = audioName
					ZoneSourceLastAudio	[Z_16_R0_Jardin___] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_16_R0_Jardin___] = audioName
					ZoneSourceLastAudio	[Z_16_R0_Jardin___] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_16_R0_Jardin___] = audioName
					ZoneSourceLastAudio	[Z_16_R0_Jardin___] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
	
				    CASE 'TVE':  
				    {         
					ZoneSourceSelectedAudio	[Z_16_R0_Jardin___] = audioName
					ZoneSourceLastAudio	[Z_16_R0_Jardin___] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }
				    
				    CASE 'Son2':  //Used 2nd for ui switching purpose
				    {         
					ZoneSourceSelectedAudio	[Z_16_R0_Jardin___] = audioName
					ZoneSourceLastAudio	[Z_16_R0_Jardin___] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }				    						
				}
			}
		}
  

		CASE 'Bar':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_17_R0_Bar_ext__] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_17_R0_Bar_ext__]
			
			
			IF (ZoneSourceSelectedAudio[Z_17_R0_Bar_ext__] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_17_R0_Bar_ext__] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_17_R0_Bar_ext__] = audioName
					ZoneSourceLastAudio	[Z_17_R0_Bar_ext__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_17_R0_Bar_ext__] = audioName
					ZoneSourceLastAudio	[Z_17_R0_Bar_ext__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_17_R0_Bar_ext__] = audioName
					ZoneSourceLastAudio	[Z_17_R0_Bar_ext__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_17_R0_Bar_ext__] = audioName
					ZoneSourceLastAudio	[Z_17_R0_Bar_ext__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					   

				    CASE 'TV':  
				    {         
					ZoneSourceSelectedAudio	[Z_17_R0_Bar_ext__] = audioName
					ZoneSourceLastAudio	[Z_17_R0_Bar_ext__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					    
	
				    CASE 'TVE':  //Eiffel TV
				    {         
					ZoneSourceSelectedAudio	[Z_17_R0_Bar_ext__] = audioName
					ZoneSourceLastAudio	[Z_17_R0_Bar_ext__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }
				    
				    CASE 'Son':  
				    {         
					ZoneSourceSelectedAudio	[Z_17_R0_Bar_ext__] = audioName
					ZoneSourceLastAudio	[Z_17_R0_Bar_ext__] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    					    
				}
			}
		}
  


		CASE 'Palier_RDC':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_18_R0_Palier_et] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_18_R0_Palier_et]
			
			
			IF (ZoneSourceSelectedAudio[Z_18_R0_Palier_et] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_18_R0_Palier_et] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_18_R0_Palier_et] = audioName
					ZoneSourceLastAudio	[Z_18_R0_Palier_et] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_18_R0_Palier_et] = audioName
					ZoneSourceLastAudio	[Z_18_R0_Palier_et] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_18_R0_Palier_et] = audioName
					ZoneSourceLastAudio	[Z_18_R0_Palier_et] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_18_R0_Palier_et] = audioName
					ZoneSourceLastAudio	[Z_18_R0_Palier_et] = audioName
				    
					UpdateViewState(Etage_RDC)
				    }					   	
				    					    
				}
			}
		}
  
// R1 --------------------------------------------------------------------------
		CASE 'Eiffel':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_19_R1_Salle_Eif] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Audio Off',etage, act_index)
				UpdateViewState(Etage_R1)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_19_R1_Salle_Eif]
			
			
			IF (ZoneSourceSelectedAudio[Z_19_R1_Salle_Eif] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_19_R1_Salle_Eif] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_19_R1_Salle_Eif] = audioName
					ZoneSourceLastAudio	[Z_19_R1_Salle_Eif] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_19_R1_Salle_Eif] = audioName
					ZoneSourceLastAudio	[Z_19_R1_Salle_Eif] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_19_R1_Salle_Eif] = audioName
					ZoneSourceLastAudio	[Z_19_R1_Salle_Eif] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_19_R1_Salle_Eif] = audioName
					ZoneSourceLastAudio	[Z_19_R1_Salle_Eif] = audioName
				    
					UpdateViewState(Etage_R1)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_19_R1_Salle_Eif] = audioName
					ZoneSourceLastAudio	[Z_19_R1_Salle_Eif] = audioName
				    
					UpdateViewState(Etage_R1)
				    }					    
	
				    CASE 'TVE':  //Eiffel TV
				    {         
					ZoneSourceSelectedAudio	[Z_19_R1_Salle_Eif] = audioName
					ZoneSourceLastAudio	[Z_19_R1_Salle_Eif] = audioName
				    
					UpdateViewState(Etage_R1)
				    }
				    
				    CASE 'SonE':  
				    {         
					ZoneSourceSelectedAudio	[Z_19_R1_Salle_Eif] = audioName
					ZoneSourceLastAudio	[Z_19_R1_Salle_Eif] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    					    
				}
			}
		}
  
		CASE 'Tronquois':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_20_R1_Salle_Tro] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Audio Off',etage, act_index)
				UpdateViewState(Etage_R1)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_20_R1_Salle_Tro]
			
			
			IF (ZoneSourceSelectedAudio[Z_20_R1_Salle_Tro] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_20_R1_Salle_Tro] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_20_R1_Salle_Tro] = audioName
					ZoneSourceLastAudio	[Z_20_R1_Salle_Tro] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_20_R1_Salle_Tro] = audioName
					ZoneSourceLastAudio	[Z_20_R1_Salle_Tro] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_20_R1_Salle_Tro] = audioName
					ZoneSourceLastAudio	[Z_20_R1_Salle_Tro] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_20_R1_Salle_Tro] = audioName
					ZoneSourceLastAudio	[Z_20_R1_Salle_Tro] = audioName
				    
					UpdateViewState(Etage_R1)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_20_R1_Salle_Tro] = audioName
					ZoneSourceLastAudio	[Z_20_R1_Salle_Tro] = audioName
				    
					UpdateViewState(Etage_R1)
				    }					    
	
				    CASE 'TVT':  //Eiffel TV
				    {         
					ZoneSourceSelectedAudio	[Z_20_R1_Salle_Tro] = audioName
					ZoneSourceLastAudio	[Z_20_R1_Salle_Tro] = audioName
				    
					UpdateViewState(Etage_R1)
				    }
				    
				    CASE 'SonT':  
				    {         
					ZoneSourceSelectedAudio	[Z_20_R1_Salle_Tro] = audioName
					ZoneSourceLastAudio	[Z_20_R1_Salle_Tro] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    CASE 'TVE':  //Eiffel TV
				    {         
					ZoneSourceSelectedAudio	[Z_20_R1_Salle_Tro] = audioName
					ZoneSourceLastAudio	[Z_20_R1_Salle_Tro] = audioName
				    
					UpdateViewState(Etage_R1)
				    }
				    
				    CASE 'SonE':  //Son Eiffel
				    {         
					ZoneSourceSelectedAudio	[Z_20_R1_Salle_Tro] = audioName
					ZoneSourceLastAudio	[Z_20_R1_Salle_Tro] = audioName
				    
					UpdateViewState(Etage_SS)
				    }	
				}
			}
		}
  
		CASE 'Terrasse':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_23_R1_Terrasse] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_R1)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_23_R1_Terrasse]
			
			
			IF (ZoneSourceSelectedAudio[Z_23_R1_Terrasse] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_23_R1_Terrasse] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_23_R1_Terrasse] = audioName
					ZoneSourceLastAudio	[Z_23_R1_Terrasse] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_23_R1_Terrasse] = audioName
					ZoneSourceLastAudio	[Z_23_R1_Terrasse] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_23_R1_Terrasse] = audioName
					ZoneSourceLastAudio	[Z_23_R1_Terrasse] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Airplay2':  
				    {         
					ZoneSourceSelectedAudio	[Z_23_R1_Terrasse] = audioName
					ZoneSourceLastAudio	[Z_23_R1_Terrasse] = audioName
				    
					UpdateViewState(Etage_R1)
				    }					   

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_23_R1_Terrasse] = audioName
					ZoneSourceLastAudio	[Z_23_R1_Terrasse] = audioName
				    
					UpdateViewState(Etage_R1)
				    }					    
	
				    CASE 'TVT':  //Eiffel TV
				    {         
					ZoneSourceSelectedAudio	[Z_23_R1_Terrasse] = audioName
					ZoneSourceLastAudio	[Z_23_R1_Terrasse] = audioName
				    
					UpdateViewState(Etage_R1)
				    }
				    
				    CASE 'SonT':  
				    {         
					ZoneSourceSelectedAudio	[Z_23_R1_Terrasse] = audioName
					ZoneSourceLastAudio	[Z_23_R1_Terrasse] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    CASE 'TVE':  //Eiffel TV
				    {         
					ZoneSourceSelectedAudio	[Z_23_R1_Terrasse] = audioName
					ZoneSourceLastAudio	[Z_23_R1_Terrasse] = audioName
				    
					UpdateViewState(Etage_R1)
				    }
				    
				    CASE 'SonE':  //Son Eiffel
				    {         
					ZoneSourceSelectedAudio	[Z_23_R1_Terrasse] = audioName
					ZoneSourceLastAudio	[Z_23_R1_Terrasse] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				}
			}
		}
  

		CASE 'Bureau':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_24_R1_BureauMme] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_R1)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_24_R1_BureauMme]
			
			
			IF (ZoneSourceSelectedAudio[Z_24_R1_BureauMme] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_24_R1_BureauMme] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_24_R1_BureauMme] = audioName
					ZoneSourceLastAudio	[Z_24_R1_BureauMme] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_24_R1_BureauMme] = audioName
					ZoneSourceLastAudio	[Z_24_R1_BureauMme] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_24_R1_BureauMme] = audioName
					ZoneSourceLastAudio	[Z_24_R1_BureauMme] = audioName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				}
			}
		}
//R5
		CASE 'Visions':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_26_R5_Visions_d] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Audio Off',etage, act_index)
				UpdateViewState(Etage_R5)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_26_R5_Visions_d]
			
			
			IF (ZoneSourceSelectedAudio[Z_26_R5_Visions_d] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_26_R5_Visions_d] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_26_R5_Visions_d] = audioName
					ZoneSourceLastAudio	[Z_26_R5_Visions_d] = audioName
				    
					UpdateViewState(Etage_R5)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_26_R5_Visions_d] = audioName
					ZoneSourceLastAudio	[Z_26_R5_Visions_d] = audioName
				    
					UpdateViewState(Etage_R5)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_26_R5_Visions_d] = audioName
					ZoneSourceLastAudio	[Z_26_R5_Visions_d] = audioName
				    
					UpdateViewState(Etage_R5)
				    }	

				    CASE 'BT':  
				    {         
					ZoneSourceSelectedAudio	[Z_26_R5_Visions_d] = audioName
					ZoneSourceLastAudio	[Z_26_R5_Visions_d] = audioName
				    
					UpdateViewState(Etage_R5)
				    }					    
	
				    CASE 'HOLO':  //Eiffel TV
				    {         
					ZoneSourceSelectedAudio	[Z_26_R5_Visions_d] = audioName
					ZoneSourceLastAudio	[Z_26_R5_Visions_d] = audioName
				    
					UpdateViewState(Etage_R5)
				    }
				    
				    CASE 'Ecran':  
				    {         
					ZoneSourceSelectedAudio	[Z_26_R5_Visions_d] = audioName
					ZoneSourceLastAudio	[Z_26_R5_Visions_d] = audioName
				    
					UpdateViewState(Etage_R5)
				    }	
				}
			}
		}
  

		
		CASE 'Pigeonnier':
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedAudio[Z_27_R5_Pigeonnie] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_R5)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(audioName=='LastState') 
				audioName = ZoneSourceLastAudio[Z_27_R5_Pigeonnie]
			
			
			IF (ZoneSourceSelectedAudio[Z_27_R5_Pigeonnie] <> audioName)
			{
				ZoneSourceSelectedAudio[Z_27_R5_Pigeonnie] = "'Processing ',audioName" 
				
				SWITCH (audioName)
				{ 
				
				    CASE 'LeDix':  
				    {         
					ZoneSourceSelectedAudio	[Z_27_R5_Pigeonnie] = audioName
					ZoneSourceLastAudio	[Z_27_R5_Pigeonnie] = audioName
				    
					UpdateViewState(Etage_R5)
				    }	
				    
				    CASE 'LeDix2':  
				    {         
					ZoneSourceSelectedAudio	[Z_27_R5_Pigeonnie] = audioName
					ZoneSourceLastAudio	[Z_27_R5_Pigeonnie] = audioName
				    
					UpdateViewState(Etage_R5)
				    }	
				    
				    CASE 'Airplay':  
				    {         
					ZoneSourceSelectedAudio	[Z_27_R5_Pigeonnie] = audioName
					ZoneSourceLastAudio	[Z_27_R5_Pigeonnie] = audioName
				    
					UpdateViewState(Etage_R5)
				    }	
	
				}
			}
		}
	}
}



/*
    Video switch from PLAN View and From Classic Room View
    act_index 0 (Room)
    act_index > 0 (PLAN View)
*/
DEFINE_FUNCTION Video(DEV dvTP, CHAR zone[], CHAR videoName[], INTEGER etage, INTEGER act_index)
{


	LOCAL_VAR DEV lvTP
	lvTP = dvTP //used to retain the last tp

	//IF(videoName<>'Party' || videoName<>'PartyM') SEND_COMMAND dvTP, "'^TXT-', ITOA(I_A_AV_TOP), ',0,', videoName"


	SWITCH (zone)
	{


// SS -----------------------------------------------------------------------------
		
		CASE 'Vestiaires': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_2__SS_Vestiaire] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off', etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			

			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_2__SS_Vestiaire]
			
			
			IF (ZoneSourceSelectedVideo[Z_2__SS_Vestiaire] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_2__SS_Vestiaire] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				    CASE 'USB':  
				    {         
					ZoneSourceSelectedVideo	[Z_2__SS_Vestiaire] = videoName
					ZoneSourceLastVideo	[Z_2__SS_Vestiaire] = videoName
				    
					UpdateViewState(Etage_SS)
				    }					
				    
				}
			}
		}
		
		CASE 'BainJap': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_4__SS_Bain_Japo] <> 'Off'){
				//Switch OFF
				IF(ZoneSourceSelectedAudio[Z_4__SS_Bain_Japo] <> 'Ecran')
					Scene(lvTP, zone, 'Video Off', etage,  act_index)
				ELSE
					Scene(lvTP, zone, 'Off', etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_4__SS_Bain_Japo]
			
			
			IF (ZoneSourceSelectedVideo[Z_4__SS_Bain_Japo] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_4__SS_Bain_Japo] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				    CASE 'TNT':  
				    {         
					ZoneSourceSelectedVideo	[Z_4__SS_Bain_Japo] = videoName
					ZoneSourceLastVideo	[Z_4__SS_Bain_Japo] = videoName
				    
					UpdateViewState(Etage_SS)
				    }

				    CASE 'BS':  
				    {         
					ZoneSourceSelectedVideo	[Z_4__SS_Bain_Japo] = videoName
					ZoneSourceLastVideo	[Z_4__SS_Bain_Japo] = videoName
				    
					UpdateViewState(Etage_SS)
				    }				
				    
				    CASE 'ATV':  
				    {         
					ZoneSourceSelectedVideo	[Z_4__SS_Bain_Japo] = videoName
					ZoneSourceLastVideo	[Z_4__SS_Bain_Japo] = videoName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'Android':  
				    {         
					ZoneSourceSelectedVideo	[Z_4__SS_Bain_Japo] = videoName
					ZoneSourceLastVideo	[Z_4__SS_Bain_Japo] = videoName
				    
					UpdateViewState(Etage_SS)
				    }				    
				}
			}			

		}		

		CASE 'Shiseido': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_7__SS_Shiseido_] <> 'Off'){
				//Switch OFF
				/*IF((ZoneSourceSelectedAudio[Z_7__SS_Shiseido_] <> 'PCAudio') && (ZoneSourceSelectedAudio[Z_7__SS_Shiseido_] <> 'BSAudio'))
					Scene(lvTP, zone, 'Video Off', etage,  act_index)
				ELSE*/
					Scene(lvTP, zone, 'Off',etage, act_index)
				UpdateViewState(Etage_SS)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_7__SS_Shiseido_]
			
			
			IF (ZoneSourceSelectedVideo[Z_7__SS_Shiseido_] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_7__SS_Shiseido_] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				    CASE 'TNT':  
				    {         
					ZoneSourceSelectedVideo	[Z_7__SS_Shiseido_] = videoName
					ZoneSourceLastVideo	[Z_7__SS_Shiseido_] = videoName
				    
					UpdateViewState(Etage_SS)
				    }	
				    				    
				    CASE 'BS':  
				    {         
					ZoneSourceSelectedVideo	[Z_7__SS_Shiseido_] = videoName
					ZoneSourceLastVideo	[Z_7__SS_Shiseido_] = videoName
				    
					UpdateViewState(Etage_SS)
				    }	
				    
				    CASE 'PC':  
				    {         
					ZoneSourceSelectedVideo	[Z_7__SS_Shiseido_] = videoName
					ZoneSourceLastVideo	[Z_7__SS_Shiseido_] = videoName
				    
					UpdateViewState(Etage_SS)
				    }					    
				}
			}			
	
		}
		

// RDC -----------------------------------------------------------------------------
    
		CASE 'Pavillon': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_11_R0_Accueil_P] <> 'Off'){
				//Switch OFF
				IF(ZoneSourceSelectedAudio[Z_11_R0_Accueil_P] <> 'Ecran')
					Scene(lvTP, zone, 'Video Off', etage,  act_index)
				ELSE
					Scene(lvTP, zone, 'Off', etage,  act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_11_R0_Accueil_P]
			
			
			IF (ZoneSourceSelectedVideo[Z_11_R0_Accueil_P] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_11_R0_Accueil_P] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				
				    CASE 'TNT':  
				    {         
					ZoneSourceSelectedVideo	[Z_11_R0_Accueil_P] = videoName
					ZoneSourceLastVideo	[Z_11_R0_Accueil_P] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'BS':  
				    {         
					ZoneSourceSelectedVideo	[Z_11_R0_Accueil_P] = videoName
					ZoneSourceLastVideo	[Z_11_R0_Accueil_P] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'BS2':  
				    {         
					ZoneSourceSelectedVideo	[Z_11_R0_Accueil_P] = videoName
					ZoneSourceLastVideo	[Z_11_R0_Accueil_P] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'ATV':  
				    {         
					ZoneSourceSelectedVideo	[Z_11_R0_Accueil_P] = videoName
					ZoneSourceLastVideo	[Z_11_R0_Accueil_P] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Android':  
				    {         
					ZoneSourceSelectedVideo	[Z_11_R0_Accueil_P] = videoName
					ZoneSourceLastVideo	[Z_11_R0_Accueil_P] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }				    
				}
			}			

		}

		    
		CASE 'Salon': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_12_R0_Grand_Sal] <> 'Off'){
				//Switch OFF
				IF(ZoneSourceSelectedAudio[Z_12_R0_Grand_Sal] <> 'TV')
					Scene(lvTP, zone, 'Video Off', etage,  act_index)
				ELSE
					Scene(lvTP, zone, 'Off', etage,  act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_12_R0_Grand_Sal]
			
			
			IF (ZoneSourceSelectedVideo[Z_12_R0_Grand_Sal] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_12_R0_Grand_Sal] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				    CASE 'TNT':  
				    {         
					ZoneSourceSelectedVideo	[Z_12_R0_Grand_Sal] = videoName
					ZoneSourceLastVideo	[Z_12_R0_Grand_Sal] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    				    
								    
				    CASE 'BS':  
				    {         
					ZoneSourceSelectedVideo	[Z_12_R0_Grand_Sal] = videoName
					ZoneSourceLastVideo	[Z_12_R0_Grand_Sal] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    
				    CASE 'ATV':  
				    {         
					ZoneSourceSelectedVideo	[Z_12_R0_Grand_Sal] = videoName
					ZoneSourceLastVideo	[Z_12_R0_Grand_Sal] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }	
				    
				    CASE 'Android':  
				    {         
					ZoneSourceSelectedVideo	[Z_12_R0_Grand_Sal] = videoName
					ZoneSourceLastVideo	[Z_12_R0_Grand_Sal] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }				    
				}
			}			

		}


		CASE 'Atelier': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_15_R0_Atelier_d] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off', etage, act_index)
				UpdateViewState(Etage_RDC)
				RETURN
			    }
			}
			

			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_15_R0_Atelier_d]
			
			
			IF (ZoneSourceSelectedVideo[Z_15_R0_Atelier_d] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_15_R0_Atelier_d] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				    CASE 'USB':  
				    {         
					ZoneSourceSelectedVideo	[Z_15_R0_Atelier_d] = videoName
					ZoneSourceLastVideo	[Z_15_R0_Atelier_d] = videoName
				    
					UpdateViewState(Etage_RDC)
				    }					
				    
				}
			}
		}
				
// R1 -----------------------------------------------------------------------------


		CASE 'Eiffel': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_19_R1_Salle_Eif] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off', etage,  act_index)
				UpdateViewState(Etage_R1)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_19_R1_Salle_Eif]
			
			
			IF (ZoneSourceSelectedVideo[Z_19_R1_Salle_Eif] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_19_R1_Salle_Eif] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				
				    CASE 'TNT':  
				    {         
					ZoneSourceSelectedVideo	[Z_19_R1_Salle_Eif] = videoName
					ZoneSourceLastVideo	[Z_19_R1_Salle_Eif] = videoName
				    
					UpdateViewState(Etage_R1)
				    }
				    
				    
				    CASE 'BS':  
				    {         
					ZoneSourceSelectedVideo	[Z_19_R1_Salle_Eif] = videoName
					ZoneSourceLastVideo	[Z_19_R1_Salle_Eif] = videoName
				    
					UpdateViewState(Etage_R1)
				    }
				    
				    CASE 'BS2':  
				    {         
					ZoneSourceSelectedVideo	[Z_19_R1_Salle_Eif] = videoName
					ZoneSourceLastVideo	[Z_19_R1_Salle_Eif] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'ATV':  
				    {         
					ZoneSourceSelectedVideo	[Z_19_R1_Salle_Eif] = videoName
					ZoneSourceLastVideo	[Z_19_R1_Salle_Eif] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Android':  
				    {         
					ZoneSourceSelectedVideo	[Z_19_R1_Salle_Eif] = videoName
					ZoneSourceLastVideo	[Z_19_R1_Salle_Eif] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'HUB':  //
				    {         
					ZoneSourceSelectedVideo	[Z_19_R1_Salle_Eif] = videoName
					ZoneSourceLastVideo	[Z_19_R1_Salle_Eif] = videoName
				    
					UpdateViewState(Etage_R1)
				    }				    
				    CASE 'Barco':  //
				    {         
					ZoneSourceSelectedVideo	[Z_19_R1_Salle_Eif] = videoName
					ZoneSourceLastVideo	[Z_19_R1_Salle_Eif] = videoName
				    
					UpdateViewState(Etage_R1)
				    }
				}
			}			

		}

		CASE 'Tronquois': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_20_R1_Salle_Tro] <> 'Off'){
				//Switch OFF
				IF(ZoneSourceSelectedAudio[Z_20_R1_Salle_Tro] <> 'TVT')
					Scene(lvTP, zone, 'Video Off', etage,  act_index)
				ELSE
					Scene(lvTP, zone, 'Off', etage,  act_index)
				UpdateViewState(Etage_R1)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_20_R1_Salle_Tro]
			
			
			IF (ZoneSourceSelectedVideo[Z_20_R1_Salle_Tro] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_20_R1_Salle_Tro] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				    CASE 'TNT':  
				    {         
					ZoneSourceSelectedVideo	[Z_20_R1_Salle_Tro] = videoName
					ZoneSourceLastVideo	[Z_20_R1_Salle_Tro] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'BS':  
				    {         
					ZoneSourceSelectedVideo	[Z_20_R1_Salle_Tro] = videoName
					ZoneSourceLastVideo	[Z_20_R1_Salle_Tro] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'BS2':  
				    {         
					ZoneSourceSelectedVideo	[Z_20_R1_Salle_Tro] = videoName
					ZoneSourceLastVideo	[Z_20_R1_Salle_Tro] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'ATV':  
				    {         
					ZoneSourceSelectedVideo	[Z_20_R1_Salle_Tro] = videoName
					ZoneSourceLastVideo	[Z_20_R1_Salle_Tro] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Android':  
				    {         
					ZoneSourceSelectedVideo	[Z_20_R1_Salle_Tro] = videoName
					ZoneSourceLastVideo	[Z_20_R1_Salle_Tro] = videoName
				    
					UpdateViewState(Etage_R1)
				    }
				    
				    CASE 'Barco':  
				    {         
					ZoneSourceSelectedVideo	[Z_20_R1_Salle_Tro] = videoName
					ZoneSourceLastVideo	[Z_20_R1_Salle_Tro] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'HUB':  
				    {         
					ZoneSourceSelectedVideo	[Z_20_R1_Salle_Tro] = videoName
					ZoneSourceLastVideo	[Z_20_R1_Salle_Tro] = videoName
				    
					UpdateViewState(Etage_R1)
				    }				    
				}
			}			

		}


		CASE 'Sanitaires': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_21_R1_Sanitaire] <> 'Off'){
				//Switch OFF
				Scene(lvTP, zone, 'Off', etage,  act_index)
				UpdateViewState(Etage_R1)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_21_R1_Sanitaire]
			
			
			IF (ZoneSourceSelectedVideo[Z_21_R1_Sanitaire] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_21_R1_Sanitaire] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				    CASE 'TNT':  
				    {         
					ZoneSourceSelectedVideo	[Z_21_R1_Sanitaire] = videoName
					ZoneSourceLastVideo	[Z_21_R1_Sanitaire] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'BS':  
				    {         
					ZoneSourceSelectedVideo	[Z_21_R1_Sanitaire] = videoName
					ZoneSourceLastVideo	[Z_21_R1_Sanitaire] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    				    
				    
				    
				    CASE 'ATV':  
				    {         
					ZoneSourceSelectedVideo	[Z_21_R1_Sanitaire] = videoName
					ZoneSourceLastVideo	[Z_21_R1_Sanitaire] = videoName
				    
					UpdateViewState(Etage_R1)
				    }	
				    
				    CASE 'Android':  
				    {         
					ZoneSourceSelectedVideo	[Z_21_R1_Sanitaire] = videoName
					ZoneSourceLastVideo	[Z_21_R1_Sanitaire] = videoName
				    
					UpdateViewState(Etage_R1)
				    }
				    
				    CASE 'CAM':  
				    {         
					ZoneSourceSelectedVideo	[Z_21_R1_Sanitaire] = videoName
					ZoneSourceLastVideo	[Z_21_R1_Sanitaire] = videoName
				    
					UpdateViewState(Etage_R1)
				    }				    
				}
			}			

		}

       
		CASE 'Bureau': //No Video???????
		{

		}

// R5 -----------------------------------------------------------------------------
	
		CASE 'Visions': 
		{
			//CALL FROM PLAN, index exists			
			IF(act_index){ // AND SOURCE IS ON		
			    IF(ZoneSourceSelectedVideo[Z_26_R5_Visions_d] <> 'Off'){
				//Switch OFF
				IF(ZoneSourceSelectedAudio[Z_26_R5_Visions_d] <> 'Ecran')
					Scene(lvTP, zone, 'Video Off', etage,  act_index)
				ELSE
					Scene(lvTP, zone, 'Off', etage,  act_index)
				UpdateViewState(Etage_R5)
				RETURN
			    }
			}
			
			//SWITCHING ON
			
			//Restore last call
			IF(videoName=='LastState') 
				videoName = ZoneSourceLastVideo[Z_26_R5_Visions_d]
			
			
			IF (ZoneSourceSelectedVideo[Z_26_R5_Visions_d] <> videoName)
			{
				ZoneSourceSelectedVideo[Z_26_R5_Visions_d] = "'Processing ',videoName" 
				

				SWITCH (videoName)
				{ 
				    CASE 'TNT':  
				    {         
					ZoneSourceSelectedVideo	[Z_26_R5_Visions_d] = videoName
					ZoneSourceLastVideo	[Z_26_R5_Visions_d] = videoName
				    
					UpdateViewState(Etage_R5)
				    }	


				    CASE 'BS':  
				    {         
					ZoneSourceSelectedVideo	[Z_26_R5_Visions_d] = videoName
					ZoneSourceLastVideo	[Z_26_R5_Visions_d] = videoName
				    
					UpdateViewState(Etage_R5)
				    }	
				    
				    
				    CASE 'BS2':  
				    {         
					ZoneSourceSelectedVideo	[Z_26_R5_Visions_d] = videoName
					ZoneSourceLastVideo	[Z_26_R5_Visions_d] = videoName
				    
					UpdateViewState(Etage_R5)
				    }	
				    
				    CASE 'ATV':  
				    {         
					ZoneSourceSelectedVideo	[Z_26_R5_Visions_d] = videoName
					ZoneSourceLastVideo	[Z_26_R5_Visions_d] = videoName
				    
					UpdateViewState(Etage_R5)
				    }	
				    
				    CASE 'Android':  
				    {         
					ZoneSourceSelectedVideo	[Z_26_R5_Visions_d] = videoName
					ZoneSourceLastVideo	[Z_26_R5_Visions_d] = videoName
				    
					UpdateViewState(Etage_R5)
				    }
				    
				    CASE 'Barco':  
				    {         
					ZoneSourceSelectedVideo	[Z_26_R5_Visions_d] = videoName
					ZoneSourceLastVideo	[Z_26_R5_Visions_d] = videoName
				    
					UpdateViewState(Etage_R5)
				    }				    
				}
			}			

		}

       
	}
	
	
}



DEFINE_FUNCTION INTEGER GetDevIndex(DEV dvTP)
{	
    STACK_VAR INTEGER cx
    STACK_VAR INTEGER dev_index
    
    dev_index = 0
    FOR(cx = 1; cx<=EFFECTIVE_TP_NB;cx++)
    {
	IF(TPTabPC[cx] == dvTP)
	{
	    dev_index = cx
	    break
	}
    }
    
    IF(!dev_index)
	debug(AMX_DEBUG, "'GetDevIndex :: Error :: Index Not Found.' ")
 
    
    RETURN dev_index
}


DEFINE_FUNCTION INTEGER GetZoneIdByName(char zone[])
{	
    STACK_VAR INTEGER cx
    STACK_VAR INTEGER id

    id = 0
    FOR(cx = 1; cx <= EFFECTIVE_NB_ZONES; cx++)
    {
	IF(ZONELIST[cx] == zone)
	{
	    id = cx
	    break
	}
    }
    
    IF(!id)
	debug(AMX_DEBUG, "'GetZoneIdByName :: Error :: Index Not Found.' ")
 
    
    RETURN id
}




DEFINE_FUNCTION INTEGER GetChannelByZoneActivity(INTEGER global_zone, Integer activity)
{
    STACK_VAR INTEGER ch  

    //ch = (zone / 10 - 1) * 10 + activity
    
    //Projecting to the floor dimention and calculating channel index
    ch = (global_zone - ZONELIST_SHIFT[global_zone] - 1) * 10 + activity
    
    //debug(AMX_DEBUG, "'GetChannelByZoneActivity ::', ZONELIST[global_zone], ' act[', ACTIVITYLIST[activity],'] => index = ',ITOA(ch)")
   
    RETURN ch
}


/*
    Update view State data
    
    Add here activity state logic. 
    Array activityViewState is being synced as channels in UI layer
*/
#WARN 'ADD YOUR ACTIVITIY STATUS CONDITIONS FOR UI FEEDBACK'
#WARN 'Replace demo switching in functions AC / Rideaux / Scenariuos by real code.'
DEFINE_FUNCTION UpdateViewState(INTEGER etage_index)
{

    debug(AMX_DEBUG, "'UpdateViewState :: ',FLOORLIST[etage_index]")
    


    SWITCH(etage_index)
    {
	CASE Etage_SS: 
	{	    
	    //Palier escaliers	
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_1__SS_Palier_es, IND_CONTROL)] 	= 0 							
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_1__SS_Palier_es, IND_AUDIO)] 	= (ZoneSourceSelectedAudio[Z_1__SS_Palier_es] <> 'Off') 		
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_1__SS_Palier_es, IND_LIGHT)] 	= (?CONDITION) 							
    
	    //Vestiaires               
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_2__SS_Vestiaire, IND_CONTROL)] 	= 0
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_2__SS_Vestiaire, IND_AUDIO)] 	= ZoneSourceSelectedAudio[Z_2__SS_Vestiaire] <> 'Off'	
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_2__SS_Vestiaire, IND_LIGHT)] 	= (?CONDITION) 							
    
	    //Tianerie 
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_3__SS_Tisanerie, IND_CONTROL)] 	= 0 							
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_3__SS_Tisanerie, IND_AUDIO)] 	= ZoneSourceSelectedAudio[Z_3__SS_Tisanerie] <> 'Off'	
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_3__SS_Tisanerie, IND_AC)] 		= (?CONDITION)						    
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_3__SS_Tisanerie, IND_LIGHT)] 	= (?CONDITION) 							
    
	    //Bain Japonis 
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_4__SS_Bain_Japo, IND_CONTROL)]	= 0 						
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_4__SS_Bain_Japo, IND_VIDEO)] 	= ( ZoneSourceSelectedVideo[Z_4__SS_Bain_Japo] <> 'Off'	/*== 'ATV' ||
													    ZoneSourceSelected[Z_4__SS_Bain_Japo] == 'TNT' || 
													    ZoneSourceSelected[Z_4__SS_Bain_Japo] == 'Android' || 
													    ZoneSourceSelected[Z_4__SS_Bain_Japo] == 'BS'*/) 	
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_4__SS_Bain_Japo, IND_AUDIO)] 	= ( ZoneSourceSelectedAudio[Z_4__SS_Bain_Japo] <> 'Off'	/*== 'LeDix' || 
													    ZoneSourceSelected[Z_4__SS_Bain_Japo] == 'LeDix2' || 
													    ZoneSourceSelected[Z_4__SS_Bain_Japo] == 'Airplay' || 
													    ZoneSourceSelected[Z_4__SS_Bain_Japo] == 'Airplay2' || 
													    ZoneSourceSelected[Z_4__SS_Bain_Japo] == 'BT' ||  
													    ZoneSourceSelected[Z_4__SS_Bain_Japo] == 'Ecran'*/)			
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_5__SS_Hammam___, IND_LIGHT)] 	= (?CONDITION) 					
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_5__SS_Hammam___, IND_AC)] 		= (?CONDITION)					
    
	    //Hamma
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_5__SS_Hammam___, IND_CONTROL)] 	= 0 
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_5__SS_Hammam___, IND_AUDIO)] 	= ZoneSourceSelectedAudio[Z_5__SS_Hammam___] <> 'Off'		
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_5__SS_Hammam___, IND_LIGHT)] 	= (?CONDITION) 			
    
	    //Saun
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_6__SS_Sauna____, IND_CONTROL)] 	= 0 
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_6__SS_Sauna____, IND_AUDIO)] 	= (ZoneSourceSelectedAudio[Z_6__SS_Sauna____] <> 'Off')		
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_6__SS_Sauna____ - 1) + IND_LIGHT]	 	= (?CONDITION) 				
	
	    //Salle de Soins Shiseido
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_7__SS_Shiseido_, IND_CONTROL)] 	= 0 
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_7__SS_Shiseido_, IND_VIDEO)] 	= ( ZoneSourceSelectedVideo[Z_7__SS_Shiseido_] <> 'Off'	/*== 'TNT' ||
													    ZoneSourceSelected[Z_7__SS_Shiseido_] == 'PC' ||	    
													    ZoneSourceSelected[Z_7__SS_Shiseido_] == 'BS'*/)	
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_7__SS_Shiseido_, IND_AUDIO)] 	= ( ZoneSourceSelectedAudio[Z_7__SS_Shiseido_] <> 'Off'	/*== 'LeDix' || 
													    ZoneSourceSelected[Z_7__SS_Shiseido_] == 'LeDix2' || 
													    ZoneSourceSelected[Z_7__SS_Shiseido_] == 'PCAudio' || 
													    ZoneSourceSelected[Z_7__SS_Shiseido_] == 'BSAudio' || 
													    ZoneSourceSelected[Z_7__SS_Shiseido_] == 'BT' || 
													    ZoneSourceSelected[Z_7__SS_Shiseido_] == 'RCA'*/)				
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_7__SS_Shiseido_, IND_LIGHT)] 	= (?CONDITION) 					
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_7__SS_Shiseido_, IND_AC)] 		= (?CONDITION) 					
    
	    //Douches bambou
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_8__SS_Douches_b, IND_CONTROL)] 	= 0 //Control
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_8__SS_Douches_b, IND_AUDIO)] 	= ZoneSourceSelectedAudio[Z_8__SS_Douches_b] <> 'Off'	
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_8__SS_Douches_b, IND_AC)] 		= (?CONDITION) 								
	    
	    //Douche Sauna 	
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_9__SS_Douche_Sa, IND_CONTROL)] 	= 0 //Control
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_9__SS_Douche_Sa, IND_AC)] 		= (?CONDITION) 					
	    
	    //WC Espace Bien-Ãªtre	
	    activityViewState[Etage_SS][GetChannelByZoneActivity(Z_10_SS_WC_Espace, IND_CONTROL)] 	= 0 //Control
	    //activityViewState[Etage_SS][GetChannelByZoneActivity(Z_10_SS_WC_Espace, IND_LIGHT)] 	= (?CONDITION) 					
	    
	}
	    
		
	
	CASE Etage_RDC: 
	{
	    
	    //Accueil Pavillon  
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_11_R0_Accueil_P,IND_CONTROL)] 	= 0 
	    			
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_11_R0_Accueil_P, IND_VIDEO)] 	= ( ZoneSourceSelectedVideo[Z_11_R0_Accueil_P] <> 'Off'	/*== 'TNT' || 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'ATV' || 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'Android'|| 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'BS'|| 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'BS2'*/) //Video		              
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_11_R0_Accueil_P, IND_AUDIO)] 	= ( ZoneSourceSelectedAudio[Z_11_R0_Accueil_P] <> 'Off'	/*<> 'Off'== 'LeDix' || 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'LeDix2' || 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'Airplay' || 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'Airplay2' || 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'BT'|| 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'Ecran'|| 
													    ZoneSourceSelected[Z_11_R0_Accueil_P] == 'TV'*/)	//Audio		
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_11_R0_Accueil_P, IND_LIGHT)] 	= (?CONDITION) 								
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_11_R0_Accueil_P, IND_AC)] 	= (?CONDITION)									
	    
	    
	    
	    //Grand Salon                
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_12_R0_Grand_Sal, IND_CONTROL)] 	= 0 								
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_12_R0_Grand_Sal, IND_VIDEO)] 	= ( ZoneSourceSelectedVideo[Z_12_R0_Grand_Sal] <> 'Off'	/*== 'TNT' ||
													    ZoneSourceSelected[Z_12_R0_Grand_Sal] == 'ATV' || 
													    ZoneSourceSelected[Z_12_R0_Grand_Sal] == 'Android'|| 
													    ZoneSourceSelected[Z_12_R0_Grand_Sal] == 'BS'*/)		
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_12_R0_Grand_Sal, IND_AUDIO)] 	= ( ZoneSourceSelectedAudio[Z_12_R0_Grand_Sal] <> 'Off'	/*== 'LeDix' || 
													    ZoneSourceSelected[Z_12_R0_Grand_Sal] == 'LeDix2' || 
													    ZoneSourceSelected[Z_12_R0_Grand_Sal] == 'Airplay' || 
													    ZoneSourceSelected[Z_12_R0_Grand_Sal] == 'Airplay2' || 
													    ZoneSourceSelected[Z_12_R0_Grand_Sal] == 'BT'|| 
													    ZoneSourceSelected[Z_12_R0_Grand_Sal] == 'RCA'|| 
													    ZoneSourceSelected[Z_12_R0_Grand_Sal] == 'TV'*/)			
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_12_R0_Grand_Sal, IND_LIGHT)] 	= (?CONDITION) 								
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_12_R0_Grand_Sal, IND_AC)] 	= (?CONDITION)								
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_12_R0_Grand_Sal, IND_MOTOR)] 	= (?CONDITION)							
					    
	    //Salle Ã  manger             	
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_13_R0_SalleAM__, IND_CONTROL)] 	= 0							
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_13_R0_SalleAM__, IND_AUDIO)] 	= (ZoneSourceSelectedAudio[Z_13_R0_SalleAM__] <> 'Off') 		
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_13_R0_SalleAM__, IND_LIGHT)] 	= (?CONDITION) 							 
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_13_R0_SalleAM__, IND_AC)] 	= (?CONDITION)								
						
	    //Restaurant                 		
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_14_R0_Restauran, IND_CONTROL)] 	= 0 						
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_14_R0_Restauran, IND_AUDIO)] 	= (ZoneSourceSelectedAudio[Z_14_R0_Restauran] <> 'Off')			
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_14_R0_Restauran, IND_LIGHT)] 	= (?CONDITION) 								
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_14_R0_Restauran, IND_AC)] 	= (?CONDITION)								
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_14_R0_Restauran, IND_MOTOR)] 	= (?CONDITION)							
                                         
	    //Atelier de Thierry Marx    
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_15_R0_Atelier_d, IND_CONTROL)] 	= 0							
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_15_R0_Atelier_d, IND_VIDEO)] 	= ( ZoneSourceSelectedVideo[Z_15_R0_Atelier_d] <> 'Off'	/*== 'TNT' ||
													    ZoneSourceSelected[Z_15_R0_Atelier_d] == 'ATV' || 	    
													    ZoneSourceSelected[Z_15_R0_Atelier_d] == 'Android'|| 
													    ZoneSourceSelected[Z_15_R0_Atelier_d] == 'BS'*/)		
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_15_R0_Atelier_d, IND_AUDIO)] 	= ( ZoneSourceSelectedAudio[Z_15_R0_Atelier_d] <> 'Off'	/*== 'LeDix' || 
													    ZoneSourceSelected[Z_15_R0_Atelier_d] == 'LeDix2' || 
													    ZoneSourceSelected[Z_15_R0_Atelier_d] == 'Airplay' || 
													    ZoneSourceSelected[Z_15_R0_Atelier_d] == 'Airplay2' || 
													    ZoneSourceSelected[Z_15_R0_Atelier_d] == 'BT' || 
													    ZoneSourceSelected[Z_15_R0_Atelier_d] == 'TV'*/)		
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_15_R0_Atelier_d, IND_LIGHT)] 	= (?CONDITION) 					 		
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_15_R0_Atelier_d, IND_AC)] 	= (?CONDITION)							
	    
	    //Jardin   
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_16_R0_Jardin___, IND_CONTROL)] 	= 0 		
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_16_R0_Jardin___, IND_AUDIO)] 	= ( ZoneSourceSelectedAudio[Z_16_R0_Jardin___] <> 'Off') 
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_16_R0_Jardin___, IND_LIGHT)] 	= (?CONDITION) 	
 
	    //Bar extÃ©rieur
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_17_R0_Bar_ext__, IND_CONTROL)] 	= 0  	
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_17_R0_Bar_ext__, IND_AUDIO)] 	=  (ZoneSourceSelectedAudio[Z_17_R0_Bar_ext__] <> 'Off')		
	    //activityViewState[Etage_RDC][(Z_17_R0_Bar_ext__, IND_LIGHT)] 	= (?CONDITION)		
	
	    //Palier et Escaliers      	
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_18_R0_Palier_et, IND_CONTROL)] 	= 0 	
	    activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_18_R0_Palier_et, IND_AUDIO)] 	= (ZoneSourceSelectedAudio[Z_18_R0_Palier_et] <> 'Off')  		
	    //activityViewState[Etage_RDC][GetChannelByZoneActivity(Z_18_R0_Palier_et, IND_LIGHT)] 	= (?CONDITION) 		
	    
	    
	
	}
	
		
	CASE Etage_R1: 
	{
	    
	    
	    //Salle Eiffel  
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_19_R1_Salle_Eif, IND_CONTROL)] 	= 0		
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_19_R1_Salle_Eif, IND_VIDEO)] 	= ( ZoneSourceSelectedVideo[Z_19_R1_Salle_Eif] <> 'Off'	/*== 'TNT' || 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'ATV' || 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'Android'|| 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'BS'|| 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'BS2'|| 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'Barco'*/) 			
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_19_R1_Salle_Eif, IND_AUDIO)] 	= ( ZoneSourceSelectedAudio[Z_19_R1_Salle_Eif] <> 'Off'	/*== 'LeDix' || 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'LeDix2' || 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'Airplay' || 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'Airplay2' || 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'BT' || 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'TVE'|| 
													    ZoneSourceSelected[Z_19_R1_Salle_Eif] == 'SonE'*/)			       
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_19_R1_Salle_Eif, IND_LIGHT)] 	= (?CONDITION)		
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_19_R1_Salle_Eif, IND_AC)] 	= (?CONDITION)				
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_19_R1_Salle_Eif, IND_MOTOR)] 	= (?CONDITION)			
			
	    //Salle Tronquois       	
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_20_R1_Salle_Tro, IND_CONTROL)] 	= 0		
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_20_R1_Salle_Tro, IND_VIDEO)] 	= ( ZoneSourceSelectedVideo[Z_20_R1_Salle_Tro] <> 'Off'	/*== 'TNT' || 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'ATV' || 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'Android'|| 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'BS'|| 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'BS2'|| 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'Barco'|| 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'HUB'*/)			
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_20_R1_Salle_Tro, IND_AUDIO)] 	= ( ZoneSourceSelectedAudio[Z_20_R1_Salle_Tro] <> 'Off'	/*== 'LeDix' || 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'LeDix2' || 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'Airplay' || 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'Airplay2' || 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'BT' || 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'TVE'|| 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'SonE'|| 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'TVT'|| 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'SonT'*/)			
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_20_R1_Salle_Tro, IND_LIGHT)] 	= (?CONDITION)			
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_20_R1_Salle_Tro, IND_AC)] 	= (?CONDITION)			
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_20_R1_Salle_Tro, IND_MOTOR)] 	= (?CONDITION)			
			
	    //Sanitaires invitÃ©s       		
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_21_R1_Sanitaire, IND_CONTROL)] 	= 0 	
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_21_R1_Sanitaire, IND_VIDEO)] 	= (ZoneSourceSelectedAudio[Z_21_R1_Sanitaire] <> 'Off')			
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_21_R1_Sanitaire, IND_LIGHT)] 	= (?CONDITION)			 
						
	    //Pallier et Escaliers       		
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_22_R1_Pallier_e, IND_CONTROL)] 	= 0 	
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_22_R1_Pallier_e, IND_LIGHT)] 	= (?CONDITION)			
					    
	    //Terrasse                   	
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_23_R1_Terrasse, IND_CONTROL)] 	= 0 	
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_23_R1_Terrasse, IND_AUDIO)] 	= (ZoneSourceSelectedAudio[Z_23_R1_Terrasse] <> 'Off')			
	    //activityViewState[Etage_R1][(Z_23_R1_Terrasse, IND_LIGHT] 	= (?CONDITION)			
					    
	    //Bureau Mme HervÃ©           	
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_24_R1_BureauMme, IND_CONTROL)] 	= 0 	
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_24_R1_BureauMme, IND_AUDIO)] 	= (ZoneSourceSelectedAudio[Z_24_R1_BureauMme] <> 'Off') 		
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_24_R1_BureauMme, IND_LIGHT)] 	= (?CONDITION) 		
	   // activityViewState[Etage_R1][GetChannelByZoneActivity(Z_24_R1_BureauMme, IND_AC)] 	= (?CONDITION) 			
						
	    //Pallier Pavillon 1er Ã©tage 		
	    activityViewState[Etage_R1][GetChannelByZoneActivity(Z_25_R1_Pallier_P, IND_CONTROL)] 	= 0 
	    //activityViewState[Etage_R1][GetChannelByZoneActivity(Z_25_R1_Pallier_P, IND_LIGHT)] 	= (?CONDITION) 		

	}	    
	
	/*
	CASE Etage_R2: 
	{


	}
	
	CASE Etage_R3: 
	{

	}	    
	CASE Etage_R4: 
	{

	}
	*/
	
	CASE Etage_R5: 
	{
	    //Visions du monde 
	    activityViewState[Etage_R5][GetChannelByZoneActivity(Z_26_R5_Visions_d, IND_CONTROL)] 	= 0			
	    activityViewState[Etage_R5][GetChannelByZoneActivity(Z_26_R5_Visions_d, IND_VIDEO)] 	= ( ZoneSourceSelectedVideo[Z_26_R5_Visions_d] <> 'Off'	/*== 'TNT' || 
													    ZoneSourceSelected[Z_26_R5_Visions_d] == 'ATV' || 
													    ZoneSourceSelected[Z_26_R5_Visions_d] == 'Android'|| 
													    ZoneSourceSelected[Z_26_R5_Visions_d] == 'BS'|| 
													    ZoneSourceSelected[Z_26_R5_Visions_d] == 'BS2'|| 
													    ZoneSourceSelected[Z_26_R5_Visions_d] == 'Barco'*/)	 // Video		       
	    activityViewState[Etage_R5][GetChannelByZoneActivity(Z_26_R5_Visions_d, IND_AUDIO)] 	= ( ZoneSourceSelectedAudio[Z_26_R5_Visions_d] <> 'Off'	/*== 'LeDix' || 
													    ZoneSourceSelected[Z_26_R5_Visions_d] == 'LeDix2' || 
													    ZoneSourceSelected[Z_20_R1_Salle_Tro] == 'Airplay' || 
													    ZoneSourceSelected[Z_26_R5_Visions_d] == 'BT' || 
													    ZoneSourceSelected[Z_26_R5_Visions_d] == 'Holo'|| 
													    ZoneSourceSelected[Z_26_R5_Visions_d] == 'Ecran'*/)//  Audio		
	    //activityViewState[Etage_R5][GetChannelByZoneActivity(Z_26_R5_Visions_d, IND_LIGHT)] 	= (?CONDITION)			
	    //activityViewState[Etage_R5][GetChannelByZoneActivity(Z_26_R5_Visions_d, IND_AC)] 	= (?CONDITION)				
	    //activityViewState[Etage_R5][GetChannelByZoneActivity(Z_26_R5_Visions_d, IND_MOTOR)] 	= (?CONDITION)			
						
	    //Pigeonnier                 		
	    activityViewState[Etage_R5][GetChannelByZoneActivity(Z_27_R5_Pigeonnie, IND_CONTROL)] 	= 0			
	    activityViewState[Etage_R5][GetChannelByZoneActivity(Z_27_R5_Pigeonnie, IND_AUDIO)] 	= (ZoneSourceSelectedAudio[Z_27_R5_Pigeonnie] <> 'Off')	 // Audio		
	    //activityViewState[Etage_R5][GetChannelByZoneActivity(Z_27_R5_Pigeonnie, IND_LIGHT)] 	= (?CONDITION)			
	}
	
	
	DEFAULT:
	    debug(AMX_DEBUG, "'UpdateViewState :: Error : Unknown Etage = ', ITOA(etage_index)")
	
    }

}

/*
    AC Zones
*/
DEFINE_FUNCTION AC(DEV dvTP, CHAR zone[], CHAR audioName[50], INTEGER etage, INTEGER act_index)
{
    //Demo coding. Changing state.
    //Replace demo switching by REAL code.
    //Use UpdateViewState for sync UI values
    activityViewState[etage][act_index] = (activityViewState[etage][act_index]  == 0)
}


/*
    LIGHT Zones
*/
DEFINE_FUNCTION Scenarios(DEV dvTP, CHAR zone[], CHAR audioName[50], INTEGER etage, INTEGER act_index)
{
    //Demo coding. Changing state.
    //Replace demo switching by REAL code.
    //Use UpdateViewState for sync UI values
    activityViewState[etage][act_index] = (activityViewState[etage][act_index]  == 0)
}

/*
    Shades in Zones
*/
DEFINE_FUNCTION Rideaux(DEV dvTP, CHAR zone[], CHAR name[50], INTEGER etage, INTEGER act_index)
{
    //Demo coding. Changing state.
    //Replace demo switching by REAL code.
    //Use UpdateViewState for sync UI values
    activityViewState[etage][act_index] = (activityViewState[etage][act_index]  == 0)
    
    //Callbacks for Shades
    
    /*
	SHA@Salon@All@Open
	SHA@Salon@All@Stop
	SHA@Salon@All@Close
	
	SHA@Restaurant@All@Open
	SHA@Restaurant@All@Stop
	SHA@Restaurant@All@Close
	
	SHA@Eiffel@All@Open
	SHA@Eiffel@All@Stop
	SHA@Eiffel@All@Close
	
	SHA@Tronquois@All@Open
	SHA@Tronquois@All@Stop
	SHA@Tronquois@All@Close
	
	SHA@Visions@All@Open
	SHA@Visions@All@Stop
	SHA@Visions@All@Close
    */
    
    
}

DEFINE_FUNCTION EXECUTE_STRING(DEV dev_, CHAR txt_[])
{

		LOCAL_VAR CHAR str[200]
		LOCAL_VAR CHAR tab[5][45]
		LOCAL_VAR DEV lvTP
		local_var char tmpZone[50]
		local_var integer i
		local_var integer tp
		
		str = txt_ //DATA.TEXT
		lvTP = dev_ //DATA.DEVICE
		
		tab[1] = '' //memory ptr clean (JAVA :)
		tab[2] = ''
		tab[3] = ''
		tab[4] = ''
		tab[5] = ''
		
		//Force slot 1 on iPads
		if (left_string(str, 7) == 'Profile')
		{
			if (remove_string(str, 'TP4FileSlot,', 1) <> '')
			{
				/*if (((lvTP == dvTP_iPad_1) || (lvTP == dvTP_iPad_2) || (lvTP == dvTP_iPad_3) || (lvTP == dvTP_iPad_4))
					&& (atoi(left_string(str, 1)) <> 1)) //Slot ID
				{
					send_command lvTP, 'TPCCMD-1;TP4FileSlot,1;'
				}*/
			}
		}
		else
		{	
			StringSplit(str, '@', tab)
		
			//Broadcast TPC string to System 1
			//SEND_STRING vdvBridge, "'CAST=',ITOA(DATA.DEVICE.NUMBER),':1:1=',DATA.TEXT"
		
		
			SWITCH (tab[1])
			{
				/*
				case 'LIG':	//
				{
					tp = TPNumberIntPC(lvTP)
					IF(tab[2]=='Smart') 
					    tmpZone = tab[2]
					ELSE
					    tab[2] = lastZoneSelectedInTP[tp]
					
					switch(tab[3])
					{
						default:
						{
						    
						    lightScenario(lvTP, tab[2], "tab[3]")   
						}
					}
				}
				*/				
			
				case 'AUD':	//Audio (Layout : "AUD@Living@FM Tuner")
				{
					tp = TPNumberIntPC(lvTP)
					
					
					
										
					SWITCH(tab[3])
					{
						
						//CASE 'Party':  	
						  //  CALL 'sendAudioToAll' (data.device, tab[2])						
						
						DEFAULT:
						    Audio(lvTP, tab[2], "tab[3]",0,0)
					}
					
				}	
								

				CASE 'VID': //Video (Layout : "VID@Living@Apple TV(@1)")
				{
					//STACK_VAR INTEGER tp
					tp = TPNumberIntPC(data.device) // in common_master_code
					    
					Video(lvTP, tab[2], "tab[3]",0,0)
				}
				
				CASE 'MSG': //SCE or LIG
				
				
				CASE 'SCE': //Scene (Layout : "SCE@Living@Off")
				{
					//Switch last zone selected in TP if the AV Off button is generic in the TP4
					if (tab[2] == 'TNT' || tab[2] == 'Apple TV' || tab[2] == 'Android' || tab[2] == 'Tuner FM') 
					{
						debug(AMX_DEBUG, "'PROXY OFF ZONE[',lastZoneSelectedInTP[TPNumberPC(lvTP)],'] FROM PANEL = ', ITOA(TPNumberPC(lvTP))")
						Scene(lvTP, lastZoneSelectedInTP[TPNumberPC(lvTP)], 'Off',0,0)						
					}
					else
						Scene(lvTP, tab[2], tab[3],0, 0)
				}			
				
				CASE 'ZON': //Zone management (Layout : "ZON@Living")
				CASE 'VOL': //Volume management (Layout : "VOL@Living") - used in the audio matrix
				{
					LOCAL_VAR CHAR _volPopup[60]
					LOCAL_VAR CHAR zoneInThisNX
					
					zoneInThisNX = TRUE
					
					
					SWITCH (tab[2])
					{
						//System #1
						
						
						CASE 'Office':		_volPopup = 'VOL - Z01 - Office' 
									
						DEFAULT : zoneInThisNX = FALSE
					}
					
					IF (zoneInThisNX)
					{
						SEND_COMMAND lvTP, "'^CPF-', ITOA(i_ad_ClosedVolume)" //Clear page flip on volume button
						SEND_COMMAND lvTP, "'^APF-', ITOA(i_ad_ClosedVolume), ',Togg,', _volPopup" //Add page flip
						send_command lvTP, "'^APF-', itoa(i_ad_ClosedVolume), ',ClearG,z_VOL_CLO'" //Add page flip
						
						IF (tab[1] == 'VOL')
							SEND_COMMAND lvTP, "'PPOG-', _volPopup" 
					}
				}
				
				CASE 'CH':
				{
				    //DO_PUSH(dvTP_iPad_2_Shiseido,ATOI(tab[2]))
				    //DO_RELEASE(dvTP_iPad_2_Shiseido,ATOI(tab[2]))
				}	
			}

		}
}


(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE

(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)

(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)
DEFINE_START
/*
DEFINE_FUNCTION RefreshTime()
{
	SEND_COMMAND i_TPTab,	"'^TXT-', ITOA(I_A_CLOCK),',0,', LEFT_STRING(TIME, 5)"
}
DEFINE_FUNCTION Refresh_Audio_Page(CHAR num)
{		
	[a_TPTab[num], a_ch_AudioGroupSrc[ 1]] = ((rooms[num].lastZoneAudioActivity[BEDROOM] == 'Airplay') 		|| (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Chromecast'))
	[a_TPTab[num], a_ch_AudioGroupSrc[ 2]] = ((rooms[num].lastZoneAudioActivity[BEDROOM] == 'Playlist 1') 	|| (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Playlist 2'))
	[a_TPTab[num], a_ch_AudioGroupSrc[ 3]] = ((rooms[num].lastZoneAudioActivity[BEDROOM] == 'TV'))

	[a_TPTab[num], a_ch_AudioGroupSrc[ 6]] = ((rooms[num].lastZoneAudioActivity[BATHROOM] == 'Airplay') 	|| (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Chromecast'))
	[a_TPTab[num], a_ch_AudioGroupSrc[ 7]] = ((rooms[num].lastZoneAudioActivity[BATHROOM] == 'Playlist 1') 	|| (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Playlist 2'))
	[a_TPTab[num], a_ch_AudioGroupSrc[ 8]] = ((rooms[num].lastZoneAudioActivity[BATHROOM] == 'TV'))
	
	[a_TPTab[num], a_ch_AudioSrc[ 1]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Airplay')
	[a_TPTab[num], a_ch_AudioSrc[ 2]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Chromecast')
	[a_TPTab[num], a_ch_AudioSrc[ 3]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Playlist 1')
	[a_TPTab[num], a_ch_AudioSrc[ 4]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Playlist 2')
	[a_TPTab[num], a_ch_AudioSrc[ 5]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'TV')
	
	[a_TPTab[num], a_ch_AudioSrc[11]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Airplay')
	[a_TPTab[num], a_ch_AudioSrc[12]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Chromecast')
	[a_TPTab[num], a_ch_AudioSrc[13]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Playlist 1')
	[a_TPTab[num], a_ch_AudioSrc[14]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Playlist 2')
	[a_TPTab[num], a_ch_AudioSrc[15]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'TV')
	
	[a_TPTab[num], a_ch_AudioPwr[ 1]] = ((rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off') && (rooms[num].lastZoneAudioActivity[BEDROOM] != ''))
	
	[a_TPTab[num], a_ch_AudioPwr[ 2]] = ((rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off') && (rooms[num].lastZoneAudioActivity[BATHROOM] != ''))
	
	[a_TPTab[num], a_ch_AudioLink] = ((rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off') && (rooms[num].lastZoneAudioActivity[BEDROOM] != '') && (rooms[num].lastZoneAudioActivity[BEDROOM] == rooms[num].lastZoneAudioActivity[BATHROOM]))
	
	IF(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
		SEND_LEVEL a_TPTab[num], a_l_AudioVolume[BEDROOM], BoseChambreVolume[((num-1)*2)+1]
	ELSE
		SEND_LEVEL a_TPTab[num], a_l_AudioVolume[BEDROOM], 0
		
	IF(rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off')
	{
		SEND_LEVEL a_TPTab[num], a_l_AudioVolume[BATHROOM], BoseChambreVolume[((num-1)*2)+2]
		SEND_COMMAND vdvLutron,"'K:L:',rooms[num].musiqueLedID,':1'"
	}
	ELSE
	{
		SEND_LEVEL a_TPTab[num], a_l_AudioVolume[BATHROOM], 0
		SEND_COMMAND vdvLutron,"'K:L:',rooms[num].musiqueLedID,':0'"
	}
}

DEFINE_FUNCTION Refresh_Video_Page(CHAR num)
{
	[v_TPTab[num], v_ch_VideoGroupSrc[ 1]] = ((rooms[num].lastZoneVideoActivity[1] == 'Airplay Video') || (rooms[num].lastZoneVideoActivity[1] == 'Chromecast Video'))
	
	[v_TPTab[num], v_ch_VideoSrc[ 1]] = (rooms[num].lastZoneVideoActivity[1] == 'TV')
	[v_TPTab[num], v_ch_VideoSrc[ 2]] = (rooms[num].lastZoneVideoActivity[1] == 'Airplay Video')
	[v_TPTab[num], v_ch_VideoSrc[ 3]] = (rooms[num].lastZoneVideoActivity[1] == 'Chromecast Video')
	[v_TPTab[num], v_ch_VideoSrc[ 4]] = (rooms[num].lastZoneVideoActivity[1] == 'Art')
			
	[v_TPTab[num], v_ch_VideoPwr[ 1]] = ((rooms[num].lastZoneVideoActivity[1] != 'Off')	&& (rooms[num].lastZoneVideoActivity[1] != ''))	
}

DEFINE_FUNCTION Refresh_Experience_Page(CHAR num)
{
	refreshAlarmClock(num)
}

DEFINE_FUNCTION setMute(CHAR zone, CHAR state)
{
	IF (zoneMute[zone] <> state)
	{
		bssSetValue  (dvBSS, bssMuteAddresses[zone], state);
		bssSubscribe (dvBSS, bssMuteAddresses[zone]);
	}
}

define_function Scene(dev dvTP, char zone[], char sceneName[]) // NOT USED
{
	local_var dev lvTP
	lvTP = dvTP
	
	switch (zone)
	{		
		//-----------------------------------------------------------
		// Chambre Master -------------------------------------------
		//-----------------------------------------------------------
		case 'Chambre Master':
		{
			switch (sceneName)
			{
				case 'Off':
				{
					//lastZoneAVActivity[3] = 'Off'
				}
			}
		}				
	}
}

define_function Audio(dev dvTP, char zone[], char audioName[]) // NOT USED
{
	local_var dev lvTP
	local_var char Local_AudioName[20]

	lvTP = dvTP
	Local_AudioName = audioName

	switch (zone)
	{		
		//-----------------------------------------------------------
		// Chambre Master -------------------------------------------
		//-----------------------------------------------------------
		case 'Chambre Master':
		{
/*			lastZoneAudioVideo[3] = ACT_AUDIO
			
			if (lastZoneAVActivity[3] <> audioName)
			{
				lastZoneAVActivity[3] = audioName

				send_command vdv_ip2_TV_CH_Master, 'Power:Off'					
				
				if (!a_vi_1_Power[ID_CH_M])
							SEND_COMMAND vdv_rs4_Vismes_1, "'Power:On:', itoa(ID_CH_M)"
					WAIT 5 	SEND_COMMAND vdv_rs4_Vismes_1, "'Volume:', itoa(ID_CH_M) ,':1'"
				if (a_vi_1_Input[ID_CH_M] <> INPUT_SOURCE_3)
					WAIT 10	SEND_COMMAND vdv_rs4_Vismes_1, "'Input:', itoa(ID_CH_M) ,':', itoa(INPUT_SOURCE_3)"
					
				switch (audioName)
				{
					case 'Airport 1':
					{
						WAIT 5	SEND_COMMAND vdvMatrix, 'SMART_DIG_SWITCH:3:1'	
						
						WAIT 10	SEND_COMMAND vdv_ip4_WXC_Player1, 'Zone1:Input:AIRPLAY'						
						WAIT 15	SEND_COMMAND vdv_ip4_WXC_Player1, 'Zone1:Volume:99'
						
						WAIT 15 SEND_COMMAND vdv_rs4_Vismes_1, "'Volume:', itoa(ID_CH_M) ,':', itoa(a_vi_1_startVolumes[ID_CH_M])"
					}				
				}				
			}
*/
		}
	}
}

define_function Video(dev dvTP, char zone[], char videoName[]) // NOT USED
{
	local_var dev lvTP
	lvTP = dvTP

	switch (zone)
	{		
		//-----------------------------------------------------------
		// Chambre Master -------------------------------------------
		//-----------------------------------------------------------
		case 'Chambre Master':
		{
/*
			lastZoneAudioVideo[3] = ACT_VIDEO
			
			if (lastZoneAVActivity[3] <> videoName)
			{
				lastZoneAVActivity[3] = videoName
				
				if (!a_vi_1_Power[ID_CH_M])
							SEND_COMMAND vdv_rs4_Vismes_1, "'Power:On:', itoa(ID_CH_M)"
					WAIT 5 	SEND_COMMAND vdv_rs4_Vismes_1, "'Volume:', itoa(ID_CH_M) ,':1'"
				if (a_vi_1_Input[ID_CH_M] <> INPUT_SOURCE_3)
					WAIT 10	SEND_COMMAND vdv_rs4_Vismes_1, "'Input:', itoa(ID_CH_M) ,':', itoa(INPUT_SOURCE_3)"

				switch (videoName)
				{
					case 'TNT':
					{
						send_command vdv_ip2_TV_CH_Master, 'Input:TNT'

						SEND_COMMAND vdvMatrix, 'SMART_DIG_SWITCH:3:6'
						
						WAIT 15 SEND_COMMAND vdv_rs4_Vismes_1, "'Volume:', itoa(ID_CH_M) ,':', itoa(a_vi_1_startVolumes[ID_CH_M])"
					}
				}
			}
*/		}		
	}
}
*/

(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

	DATA_EVENT[dvAMX]
	{
		ONLINE:
		{			
			TIMELINE_CREATE(TIMELINE_PROGRAM_MAIN, DEFINE_PROGRAM_TIMES, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)
/*			TIMELINE_CREATE(TIMELINE_EVERY_MINUTE, EVERY_MINUTE_TIMES, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)
			
			IP_SERVER_OPEN(dvCrestron_Bacnet.PORT, 25000, IP_TCP)
			
			CALL 'Init_Language'
			CALL 'roomsInit'
*/
		}
	}

	DATA_EVENT[vdvLutron] // !!!!!!!! ALWAYS Call lutronInit WHEN Pairing is OK !!!!!!!
	{
		STRING:
		{
			STACK_VAR CHAR str[300]
			str = UPPER_STRING(DATA.TEXT)
			
			// LUTRON INITIALISATION ONLY IF AMX & LUTRON ARE WELL CONNECTED
			IF (FIND_STRING(str,'PAIRING:OK',1)) lutronInit(vdvLutron)	
		}
	}
	
	BUTTON_EVENT[dvTP_iPad_Matrix,a_ch_AudioMatrix]
	{
		PUSH:
		{
			STACK_VAR CHAR x, y, zone
			STACK_VAR CHAR src[30]
			
			x = (GET_LAST(a_ch_AudioMatrix) - 1) % 20
			y = ((GET_LAST(a_ch_AudioMatrix) - 1) / 20) + 1	

			ZoneSelected = y
/*
			SWITCH (x)
			{
				CASE 0:	src = 'Tuner FM'
				CASE 1:	src = 'Radios Web'
				CASE 2:	src = 'Airport 1'
				CASE 3:	src = 'Airport 2'
				CASE 4:	src = 'Lecteur CD'				
				CASE 9:	src = 'Off'		
			}
			
			SWITCH (y)
			{
				CASE 1:	zone = 1 //Salon
				CASE 2:	zone = 2 //Chambre Master
				CASE 3:	zone = 3 //SDB Master
				CASE 4:	zone = 4 //Cuisine
				CASE 5:	zone = 5 //Hammam
			}
*/			
			IF(x == 19)
				bssSetValue		(dvBSS, bssSourceAddresses[y], 0)
			ELSE
				bssSetValue		(dvBSS, bssSourceAddresses[y], x+1)

			bssSubscribe	(dvBSS, bssSourceAddresses[y])
			
			//RefreshMatrix(BUTTON.INPUT.DEVICE)
		}
	}

	BUTTON_EVENT[dvTP_iPad_Matrix,a_ch_ZoneMatrix]
	{
		PUSH:
		{
			ZoneSelected = GET_LAST(a_ch_ZoneMatrix)
			
			RefreshMatrix(BUTTON.INPUT.DEVICE)
		}
	}
	
	BUTTON_EVENT[dvTP_iPad_Matrix, a_ch_VolumeMatrix]
	{
		PUSH:
		{
			SWITCH (GET_LAST(a_ch_VolumeMatrix))
			{			
				CASE 1:	// -
				{
					bssBumpVolume		(dvBSS, bssGainAddresses[ZoneSelected], VOLUME_BUMP_DOWN)
					bssSubscribePercent	(dvBSS, bssGainAddresses[ZoneSelected])
					
					// Unmute
					setMute(ZoneSelected, 0);
				}
				
				CASE 2:	// +
				{
					bssBumpVolume		(dvBSS, bssGainAddresses[ZoneSelected], VOLUME_BUMP_UP)
					bssSubscribePercent	(dvBSS, bssGainAddresses[ZoneSelected])
					
					// Unmute
					setMute(ZoneSelected, 0);
				}
				
				CASE 3:	// Mute
				{
					setMute(ZoneSelected, ! zoneMute[ZoneSelected]);
				}
			}
		}
		HOLD[3,REPEAT]:
		{
			SWITCH (GET_LAST(a_ch_VolumeMatrix))
			{			
				CASE 1:	// -
				{
					bssBumpVolume		(dvBSS, bssGainAddresses[ZoneSelected], VOLUME_BUMP_DOWN)
					bssSubscribePercent	(dvBSS, bssGainAddresses[ZoneSelected])
					
					// Unmute
					setMute(ZoneSelected, 0);
				}
				
				CASE 2:	// +
				{
					bssBumpVolume		(dvBSS, bssGainAddresses[ZoneSelected], VOLUME_BUMP_UP)
					bssSubscribePercent	(dvBSS, bssGainAddresses[ZoneSelected])
					
					// Unmute
					setMute(ZoneSelected, 0);
				}
				
				CASE 3:	// Mute
				{
					setMute(ZoneSelected, ! zoneMute[ZoneSelected]);
				}
			}
		}
	}
	DATA_EVENT[vdvBridge]
	{
		STRING:
		{
		EXECUTE_STRING(DATA.DEVICE,DATA.TEXT) 		
		}

	}





	DATA_EVENT[TPTabPC]
	{
		ONLINE:
		{
			CALL 'refreshOverview'
			//CALL 'refreshAlarmClock'
		}

		STRING:
		{
			EXECUTE_STRING(DATA.DEVICE,DATA.TEXT) 
		}
	}




	BUTTON_EVENT[TPTabPC, i_ch_LanguageSelector]
	{
		PUSH:
		{
			SWITCH (GET_LAST(i_ch_LanguageSelector))
			{
				CASE 1:	// fr
				{
					currTPLanguage[TPNumberPC(BUTTON.INPUT.DEVICE)] = 1
					debug(AMX_INFO, "'English selected for panel number ',ITOA(TPNumberPC(BUTTON.SOURCEDEV))")
					break				
				}
				CASE 2:	// en
				{
					currTPLanguage[TPNumberPC(BUTTON.INPUT.DEVICE)] = 2
					debug(AMX_INFO, "'English selected for panel number ',ITOA(TPNumberPC(BUTTON.SOURCEDEV))")
					break				
				}
					
				CASE 3:	// ru
				{
					currTPLanguage[TPNumberPC(BUTTON.INPUT.DEVICE)] = 3
					debug(AMX_INFO, "'English selected for panel number ',ITOA(TPNumberPC(BUTTON.SOURCEDEV))")
					break				
				}
					
			}
		}
	}




	BUTTON_EVENT[TPTabPC, i_ch_Volume]
	{
		PUSH:
		{
			SWITCH (GET_LAST(i_ch_Volume))
			{
			
				///-----------------------------------------------------------------------------
				//	'Palier_SS',	
				CASE 1: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 2: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 3:	// Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Vestiaires',   	
				CASE 4: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 5: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 6: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				////	Tisanerie    	
				CASE 7: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 8: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 9: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'BainJap',      	
				CASE 10: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 11: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 12: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Hammam',       	
				CASE 13: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 14: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 15: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Sauna',        	
				CASE 16: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 17: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 18: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Shiseido',     	
				CASE 19: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 20: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 21: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Bambous',      	
				CASE 22: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 23: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 24: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Douche',       	
				CASE 25: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 26: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 27: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'WC',           	
				CASE 28: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 29: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 30: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Pavillon',     	
				CASE 31: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 32: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 33: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Salon',        	
				CASE 34: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 35: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 36: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'SAM',          	
				CASE 37: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 38: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 39: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Restaurant',   	
				CASE 40: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 41: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 42: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Atelier',      	
				CASE 43: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 44: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 45: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Jardin',       	
				CASE 46: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 47: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 48: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Bar',          	
				CASE 49: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 50: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 51: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Palier_RDC',   	
				CASE 52: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 53: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 54: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Eiffel',       	
				CASE 55: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 56: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 57: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Tronquois',    	
				CASE 58: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 59: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 60: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Sanitaires',   	
				CASE 61: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 62: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 63: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Pallier_R1',   	
				CASE 64: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 65: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 66: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Terrasse',     	
				CASE 67: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 68: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 69: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Bureau',       	
				CASE 70: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 71: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 72: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Pallier_Pav',  	
				CASE 73: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 74: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 75: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Visions',  	
				CASE 76: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 77: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 78: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'
				//----------------------------------------------------------------------------- 
				//	'Pigeonnier'	
				CASE 79: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 80: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				CASE 81: // Mute	
				SEND_COMMAND vdvTemp, 'Volume:Mute:Toggle'

			}
		}
		
		HOLD[ 5, REPEAT]:
		{
			SWITCH (GET_LAST(i_ch_Volume))
			{

				///-----------------------------------------------------------------------------
				//	'Palier_SS',	
				CASE 1: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 2: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Vestiaires',   	
				CASE 4: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 5: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				 
				 
				//----------------------------------------------------------------------------- 
				////	Tisanerie    	
				CASE 7: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 8: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'BainJap',      	
				CASE 10: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 11: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Hammam',       	
				CASE 13: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 14: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Sauna',        	
				CASE 16: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 17: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Shiseido',     	
				CASE 19: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 20: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				 
				 
				//----------------------------------------------------------------------------- 
				//	'Bambous',      	
				CASE 22: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 23: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Douche',       	
				CASE 25: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 26: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				//----------------------------------------------------------------------------- 
				//	'WC',           	
				CASE 28: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 29: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Pavillon',     	
				CASE 31: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 32: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Salon',        	
				CASE 34: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 35: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				 
				 
				//----------------------------------------------------------------------------- 
				//	'SAM',          	
				CASE 37: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 38: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Restaurant',   	
				CASE 40: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 41: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				 
				 
				//----------------------------------------------------------------------------- 
				//	'Atelier',      	
				CASE 43: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 44: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Jardin',       	
				CASE 46: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 47: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				 
				 
				//----------------------------------------------------------------------------- 
				//	'Bar',          	
				CASE 49: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 50: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Palier_RDC',   	
				CASE 52: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 53: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				 
				 
				//----------------------------------------------------------------------------- 
				//	'Eiffel',       	
				CASE 55: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 56: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Tronquois',    	
				CASE 58: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 59: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				 
				 
				//----------------------------------------------------------------------------- 
				//	'Sanitaires',   	
				CASE 61: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 62: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				 
				 
				//----------------------------------------------------------------------------- 
				//	'Pallier_R1',   	
				CASE 64: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 65: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Terrasse',     	
				CASE 67: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 68: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Bureau',       	
				CASE 70: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 71: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Pallier_Pav',  	
				CASE 73: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 74: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
				 
				//----------------------------------------------------------------------------- 
				//	'Visions',  	
				CASE 76: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 77: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				 
				 
				//----------------------------------------------------------------------------- 
				//	'Pigeonnier'	
				CASE 79: // +	
				SEND_COMMAND vdvTemp, 'Volume:Up'	
				CASE 80: // -	
				SEND_COMMAND vdvTemp, 'Volume:Down'	
				
			}

			
		}	
	}



	/*
	BUTTON_EVENT[TPTabPC, i_ch_AudioMatrix]
	{
		PUSH :
		{
			STACK_VAR CHAR x, y, zone
			STACK_VAR CHAR src[30]
			
			x = (GET_LAST(i_ch_AudioMatrix) - 1) % 10
			y = ((GET_LAST(i_ch_AudioMatrix) - 1) / 10) + 1
			
			SWITCH (x)
			{
				
				CASE 0:	src = 'Sonos'
				CASE 1:	src = 'Airplay 2'
				CASE 2:	src = 'Airplay 3'
				CASE 3:	src = 'Webradio 1'
				CASE 4:	src = 'Webradio 2'
				CASE 5:	src = 'Webradio 3'
				CASE 6:	src = 'Airplay LV'
				CASE 7:	src = 'Webradio LV'			

				CASE 9:	src = 'Off'
			}
			
			SWITCH (y)
			{
				CASE 1:		zone = 1 	//OFFICE		
				CASE 2:		zone = 2 	//Meeting               
				CASE 3:		zone = 3 	//SR               
				CASE 4:		zone = 4 	//WC                       
			}
			
			IF(zone <> 0)
			{
				IF (x == 9)
					Scene(BUTTON.INPUT.DEVICE, zonesList[zone], 'Off')
				ELSE IF (x < 8)
					//Audio(BUTTON.INPUT.DEVICE, zonesList[zone], src)
					connectIdToTheGroup(zonesList[zone])
				ELSE 
					Video(BUTTON.INPUT.DEVICE, zonesList[zone], src)
			}
		}
	}
	*/
	 

	DATA_EVENT [TPTabPC]
	{
		ONLINE:
		{
				debug(AMX_DEBUG, "'********************* Panel is ONLINE ',ITOA(DATA.DEVICE.NUMBER)")
			tp_online[DATA.DEVICE.NUMBER - TPTabPC[1].NUMBER + 1] = TRUE	
			
			//SEND_LEVEL TPTabPC, VismesTPVolumeLevels[ID_MEETING			], VismesVolume[ID_MEETING		]
		}
		
		OFFLINE:
		{
			debug(AMX_DEBUG, "'********************* Panel is OFFLINE ',ITOA(DATA.DEVICE.NUMBER)")
			 tp_online[DATA.DEVICE.NUMBER - TPTabPC[1].NUMBER + 1] = FALSE	
		}



	}
		
	TIMELINE_EVENT[TIMELINE_EVERY_MINUTE]
	{			
	//-----------------------------------------------------------------------------
	// Alarm Clocks ---------------------------------------------------------------
	//-----------------------------------------------------------------------------
#IF_DEFINED COMPIL_ALARM_CLOCK

	//-----------------------------------------------------------------------------
	// GLOBAL ---------------------------------------------------------------------
	//-----------------------------------------------------------------------------		
		stack_var SINTEGER T, M, S
		stack_var char i,j

		for(i=1;i<=EFFECTIVE_TP_NB;i++)
		{		
			T = TIME_TO_HOUR(TIME)
			M = TIME_TO_MINUTE(TIME)
			S = TIME_TO_SECOND(TIME)
			
			//Alarm 1
			IF (T   == TIME_TO_HOUR("alarmTimes[i][1],':00'")   AND
				M == TIME_TO_MINUTE("alarmTimes[i][1],':00'"))
			{
				IF ((alarmExecutionCount[i][1] == 0))
				{
					if(alarmEnabled[i][1])
					{
						// TODO
					}
					
					alarmExecutionCount[i][1] = 1 
					SWITCH(i)
					{
						CASE  1: 	WAIT 599 alarmExecutionCount[ 1][1] = 0	
						CASE  2: 	WAIT 599 alarmExecutionCount[ 2][1] = 0
						CASE  3: 	WAIT 599 alarmExecutionCount[ 3][1] = 0
						CASE  4:	WAIT 599 alarmExecutionCount[ 4][1] = 0
						CASE  5: 	WAIT 599 alarmExecutionCount[ 5][1] = 0
						CASE  6: 	WAIT 599 alarmExecutionCount[ 6][1] = 0
						CASE  7: 	WAIT 599 alarmExecutionCount[ 7][1] = 0
						CASE  8: 	WAIT 599 alarmExecutionCount[ 8][1] = 0
						CASE  9: 	WAIT 599 alarmExecutionCount[ 9][1] = 0
						CASE 10: 	WAIT 599 alarmExecutionCount[10][1] = 0
					}
				}
			}
			//Alarm 2
			IF (T   == TIME_TO_HOUR("alarmTimes[i][2],':00'")   AND
				M == TIME_TO_MINUTE("alarmTimes[i][2],':00'"))
			{
				IF ((alarmExecutionCount[i][2] == 0))
				{
					if(alarmEnabled[i][2])
					{
						// TODO
					}
					alarmExecutionCount[i][2] = 1 
					SWITCH(i)
					{
						CASE  1: 	WAIT 599 alarmExecutionCount[ 1][2] = 0	
						CASE  2: 	WAIT 599 alarmExecutionCount[ 2][2] = 0
						CASE  3: 	WAIT 599 alarmExecutionCount[ 3][2] = 0
						CASE  4:	WAIT 599 alarmExecutionCount[ 4][2] = 0
						CASE  5: 	WAIT 599 alarmExecutionCount[ 5][2] = 0
						CASE  6: 	WAIT 599 alarmExecutionCount[ 6][2] = 0
						CASE  7: 	WAIT 599 alarmExecutionCount[ 7][2] = 0
						CASE  8: 	WAIT 599 alarmExecutionCount[ 8][2] = 0
						CASE  9: 	WAIT 599 alarmExecutionCount[ 9][2] = 0
						CASE 10: 	WAIT 599 alarmExecutionCount[10][2] = 0
					}		
				}
			}
			//Alarm 3
			IF (T   == TIME_TO_HOUR("alarmTimes[i][3],':00'")   AND
				M == TIME_TO_MINUTE("alarmTimes[i][3],':00'"))
			{
				IF ((alarmExecutionCount[i][3] == 0))
				{
					if(alarmEnabled[i][3])
					{
						// TODO
					}
					
					alarmExecutionCount[i][3] = 1 
					SWITCH(i)
					{
						CASE  1: 	WAIT 599 alarmExecutionCount[ 1][3] = 0	
						CASE  2: 	WAIT 599 alarmExecutionCount[ 2][3] = 0
						CASE  3: 	WAIT 599 alarmExecutionCount[ 3][3] = 0
						CASE  4:	WAIT 599 alarmExecutionCount[ 4][3] = 0
						CASE  5: 	WAIT 599 alarmExecutionCount[ 5][3] = 0
						CASE  6: 	WAIT 599 alarmExecutionCount[ 6][3] = 0
						CASE  7: 	WAIT 599 alarmExecutionCount[ 7][3] = 0
						CASE  8: 	WAIT 599 alarmExecutionCount[ 8][3] = 0
						CASE  9: 	WAIT 599 alarmExecutionCount[ 9][3] = 0
						CASE 10: 	WAIT 599 alarmExecutionCount[10][3] = 0
					}			
				}
			}
			//Alarm 4
			IF (T   == TIME_TO_HOUR("alarmTimes[i][4],':00'")   AND
				M == TIME_TO_MINUTE("alarmTimes[i][4],':00'"))
			{
				IF ((alarmExecutionCount[i][4] == 0))
				{
					if(alarmEnabled[i][4])
					{
						// TODO
					}

					alarmExecutionCount[i][4] = 1 
					SWITCH(i)
					{
						CASE  1: 	WAIT 599 alarmExecutionCount[ 1][4] = 0	
						CASE  2: 	WAIT 599 alarmExecutionCount[ 2][4] = 0
						CASE  3: 	WAIT 599 alarmExecutionCount[ 3][4] = 0
						CASE  4:	WAIT 599 alarmExecutionCount[ 4][4] = 0
						CASE  5: 	WAIT 599 alarmExecutionCount[ 5][4] = 0
						CASE  6: 	WAIT 599 alarmExecutionCount[ 6][4] = 0
						CASE  7: 	WAIT 599 alarmExecutionCount[ 7][4] = 0
						CASE  8: 	WAIT 599 alarmExecutionCount[ 8][4] = 0
						CASE  9: 	WAIT 599 alarmExecutionCount[ 9][4] = 0
						CASE 10: 	WAIT 599 alarmExecutionCount[10][4] = 0
					}		
				}
			}	
			/*
			//Alarm 5
			IF (T   == TIME_TO_HOUR("alarmTimes[5],':00'")   AND
				M == TIME_TO_MINUTE("alarmTimes[5],':00'"))
			{
				IF ((alarmExecutionCount[5] == 0))
				{
					if(alarmEnabled[5])
					{
						//SEND_COMMAND vdvLutron, "'K:P:', phantomKPID, ':6'"
					}

					alarmExecutionCount[5] = 1 
					WAIT 599 alarmExecutionCount[5] = 0			
				}
			}
			//Alarm 6
			IF (T   == TIME_TO_HOUR("alarmTimes[6],':00'")   AND
				M == TIME_TO_MINUTE("alarmTimes[6],':00'"))
			{
				IF ((alarmExecutionCount[6] == 0))
				{
					if(alarmEnabled[6])
					{
						//SEND_COMMAND vdvLutron, "'K:P:', phantomKPID, ':32'"
					}

					alarmExecutionCount[6] = 1 
					WAIT 599 alarmExecutionCount[6] = 0			
				}
			}
			//Alarm 7
			IF (T   == TIME_TO_HOUR("alarmTimes[7],':00'")   AND
				M == TIME_TO_MINUTE("alarmTimes[7],':00'"))
			{
				IF ((alarmExecutionCount[7] == 0))
				{
					if(alarmEnabled[7])
					{
						//SEND_COMMAND vdvLutron, "'K:P:', phantomKPID, ':33'"
					}

					alarmExecutionCount[7] = 1 
					WAIT 599 alarmExecutionCount[7] = 0			
				}
			}
			*/
			#END_IF
		}
		
		//refreshTime();
	}
	
	TIMELINE_EVENT[TIMELINE_PROGRAM_MAIN]
	{
		stack_var char i,j
		
		// Audio Matrix Feedback
		for(i=1;i<=NB_AUDIO_ZONES;i++)
		{	
			for(j=1;j<=NB_AUDIO_SOURCES;j++)
			{	
				[dvTP_iPad_Matrix,a_ch_AudioMatrix[((i-1)*20)+j]] = (zoneSource[i] == j)
			}
			[dvTP_iPad_Matrix,a_ch_AudioMatrix[((i-1)*20)+20]] = (zoneSource[i] == 0)
		}
	}
	
(*****************************************************************)
(*                                                               *)
(*                      !!!! WARNING !!!!                        *)
(*                                                               *)
(* Due to differences in the underlying architecture of the      *)
(* X-Series masters, changing variables in the DEFINE_PROGRAM    *)
(* section of code can negatively impact program performance.    *)
(*                                                               *)
(* See �Differences in DEFINE_PROGRAM Program Execution� section *)
(* of the NX-Series Controllers WebConsole & Programming Guide   *)
(* for additional and alternate coding methodologies.            *)
(*****************************************************************)


(*****************************************************************)
(*                       END OF PROGRAM                          *)
(*                                                               *)
(*         !!!  DO NOT PUT ANY CODE BELOW THIS COMMENT  !!!      *)
(*                                                               *)
(*****************************************************************)


