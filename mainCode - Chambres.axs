PROGRAM_NAME='_main'

#DEFINE COMPIL_ALARM_CLOCK 1
/*

Adresses Viamp
SDB 21 : 1
CHA 21 : 2
SDB 22 : 3
CHA 22 : 4
SDB 23 : 5
CHA 23 : 6
CHA CHAT 20 : 7
SDB CHAT 20 : 8

CHA 31 : 1 
SDB 31 : 2

Processeur AV principal AMX NX-3200			192.168.165.134				
Processeur AV Eiffel AMX NX-1200			192.168.165.139				
Processeur AV Shiseido AMX NX-1200			192.168.165.148				
Processeur AV Accueil AMX NX-1200			192.168.165.153				
Passerelle KNX Shiseido AMX NXB-KNX			192.168.165.149	
Extendeur Ctrl AV Salon AMX EXB-IRS4		192.168.165.156				

iPad Chambre 21			192.168.165.110				
iPad Chambre 22			192.168.165.111				
iPad Chambre 23			192.168.165.112				
iPad Chambre Ch 		192.168.165.113				
iPad Chambre 31			192.168.165.114				
iPad Chambre 32			192.168.165.115				
iPad Chambre 33			192.168.165.116				
iPad Chambre 41			192.168.165.117				
iPad Chambre 42			192.168.165.118				
iPad Chambre 43			192.168.165.119				

Streamer Airplay Chambre 21 Trivum SC311m	10.1.1.130	
Streamer Airplay Chambre 22 Trivum SC311m   10.1.1.131
Streamer Airplay Chambre 23 Trivum SC311m   10.1.1.132
Streamer Airplay Chambre Ch Trivum SC311m   10.1.1.133
Streamer Airplay Chambre 31 Trivum SC311m   10.1.1.134
Streamer Airplay Chambre 32 Trivum SC311m   10.1.1.135
Streamer Airplay Chambre 33 Trivum SC311m   10.1.1.136
Streamer Airplay Chambre 41 Trivum SC311m   10.1.1.137
Streamer Airplay Chambre 42 Trivum SC311m   10.1.1.138
Streamer Airplay Chambre 43 Trivum SC311m   10.1.1.139

Processeur Lighting TGBT Lutron HQP7-2 		192.168.165.130
Processeur Lighting RDC Lutron HQP7-2  		192.168.165.131
Processeur Lighting R+2 Lutron HQP7-2  		192.168.165.132
Processeur Lighting R+4 Lutron HQP7-2  		192.168.165.133

DSP Parties Communes BSS-BLU-160		192.168.165.135				

DSP Chambres Bose EX-1280 		192.168.165.137

Mixeur audio Eiffel Audio Technica ATDM0604		192.168.165.138	
			
Matrice HDBT Wyrestorm MXV-0606-H2A		192.168.165.140

Player vidéo Tronquois Brightsign		192.168.165.141				
Player vidéo Eiffel Brightsign			192.168.165.142				
Player vidéo Shiseido Brightsign		192.168.165.147				
Player vidéo Accueil Brightsign			192.168.165.151				
Player vidéo Salon Brightsign 			192.168.165.155				
Player vidéo R+5 Brightsign				192.168.165.158				
Player vidéo Spa Brightsign				192.168.165.161				

Ecran Surface Eiffel				192.168.165.143
Ecran de rappel #1 Eiffel			192.168.165.144				
Ecran de rappel #2 Eiffel			192.168.165.145				
Ecran Surface Tronquois				192.168.165.146
Ecran Samsung Shiseido				192.168.165.150				
TV Samsung Salon					192.168.165.154				

Splicer vidéo Accueil Novastar H2	192.168.165.152				
Splicer vidéo R+5 Novastar H2		192.168.165.159				
Splicer vidéo Spa Novastar H2		192.168.165.160				

Streamer Airplay Communs #1 Yamaha WXC50		192.168.165.162
Streamer Airplay Communs #2 Yamaha WXC50		192.168.165.163
Streamer Airplay Communs #3 Yamaha WXC50		192.168.165.164
Streamer Airplay Communs #4 Yamaha WXC50		192.168.165.165
Streamer Airplay Communs #5 Yamaha WXC50		192.168.165.166
Streamer Airplay Communs #6 Yamaha WXC50		192.168.165.167
Streamer Airplay Communs #7 Yamaha WXC50		192.168.165.168
Streamer Airplay Communs #8 Yamaha WXC50		192.168.165.169
Streamer Airplay Communs #9 Yamaha WXC50		192.168.165.157				

*/

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
	dvAMX 	= 0:1:1
	
	//-----------------------------------------------------------------------------
	// IP -------------------------------------------------------------------------
	//-----------------------------------------------------------------------------
	//Lutron QSX
	dvLutron				= 0:3:1
	vdvLutron				= 33203:1:1
	vdvDuetLutron			= 41003:1:1

	//DSP Chambres Bose EX-1280
	dvBose					= 0:5:1
	vdvBose					= 33205:1:1

	//EONA (Teveo SWI Pack / REST API)
	dvEona					= 0:7:1
	vdvEona					= 33207:1:1

	//BSS Soundweb BLU-806DA
	dvBSS					= 0:9:1
	vdvBSS					= 33209:1:1
	
	// Bacnet
	dvCrestron_Bacnet		= 0:11:1
	vdvCrestron_Bacnet		= 33211:1:1
	
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
	// Lighting -------------------------------------------------------------------
	//-----------------------------------------------------------------------------
	LOAD_NB = 2
	ROOM_NB = 2

	//-----------------------------------------------------------------------------
	// ROOM PARAMETERS ------------------------------------------------------------
	//-----------------------------------------------------------------------------
	NB_ROOMS 	= 10 // 200 + 3x X01->X03
	NB_LANGUAGE	= 6
	FR = 1
	EN = 2
	RU = 3

	// ZONES
	ZONE_NB		= 2
	BEDROOM 	= 1
	BATHROOM	= 2
	LIVING		= 3
	ENTRY		= 4
	DINING		= 5
	THEATER		= 6
	DRESSING	= 7
	CHILDREN	= 8

	// ACTIVITY
	ACTIVITY_NB	= 5
	TV			= 1
	SOUND		= 2
	LIGHTING	= 3
	SHADES		= 4
	HVAC		= 5
	
	// AUDIO VOLUME
	VOL_AIRPLAY	 	= 1
	VOL_PLAYER1		= 2
	VOL_PLAYER2		= 3
	VOL_TV			= 4
	VOL_APPLETV		= 5
	VOL_CHROMECAST	= 6
	VOL_ART			= 7

	
	//-----------------------------------------------------------------------------
	// Audio zones ----------------------------------------------------------------
	//-----------------------------------------------------------------------------
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

	STRUCTURE _ROOM
	{
		INTEGER	number							// XXX
		CHAR	name[20]
		CHAR	actived							// Is this room on the floor?
		CHAR	TP_mode							// 0:Night - 1:Day
		
		CHAR	configuration[ACTIVITY_NB][ZONE_NB]
		
		CHAR	appLanguage			//1:FR - 2:EN - 3:??
		CHAR  	dndEnabled
		CHAR  	mumrEnabled
		CHAR  	windowsOpened

		CHAR 	lastZoneAudioActivity[ZONE_NB][50]
		CHAR 	lastZoneVideoActivity[ZONE_NB][50]

		CHAR	phantomButtonAllID_ON[10]		// ALL ON
		CHAR	phantomButtonAllID_OFF[10]		// ALL OFF
		CHAR	phantomButtonMasterID_Raise[10]	// Raise
		CHAR	phantomButtonMasterID_Lower[10]	// Lower
		
		CHAR	phantomButtonBedID_ONOFF[10]	// ON/OFF	BEDROOM
		CHAR	phantomButtonBedID_1[10]		// Scene#1
		CHAR	phantomButtonBedID_2[10]		// Scene#2
		CHAR	phantomButtonBedID_3[10]		// Scene#3
		CHAR	phantomButtonBedID_4[10]		// Scene#4
		CHAR	phantomButtonBedID_Raise[10]	// Raise
		CHAR	phantomButtonBedID_Lower[10]	// Lower
		
		CHAR	phantomButtonBathID_ONOFF[10]	// ON/OFF	BATHROOM
		CHAR	phantomButtonBathID_1[10]		// Scene#1
		CHAR	phantomButtonBathID_2[10]		// Scene#2
		CHAR	phantomButtonBathID_3[10]		// Scene#3
		CHAR	phantomButtonBathID_4[10]		// Scene#4
		CHAR	phantomButtonBathID_Raise[10]	// Raise
		CHAR	phantomButtonBathID_Lower[10]	// Lower
		
		CHAR	phantomLedBedID_ONOFF[10]		// ON/OFF	BEDROOM
		CHAR	phantomLedBedID_1[10]			// Scene#1
		CHAR	phantomLedBedID_2[10]			// Scene#2
		CHAR	phantomLedBedID_3[10]			// Scene#3
		CHAR	phantomLedBedID_4[10]			// Scene#4	
		
		CHAR	phantomLedBathID_ONOFF[10]		// ON/OFF	BATHROOM
		CHAR	phantomLedBathID_1[10]			// Scene#1
		CHAR	phantomLedBathID_2[10]			// Scene#2
		CHAR	phantomLedBathID_3[10]			// Scene#3
		CHAR	phantomLedBathID_4[10]			// Scene#4
		
		CHAR	LEDFeedbackPhantom[20]

		CHAR	LightSceneLevel[2]
		
		CHAR	musiqueButtonID[10]
		CHAR	musiqueLedID[10]
		
		CHAR	wakeupButtonID[10]
		CHAR	goodnightButtonID[10]

		CHAR	DND_loadID[10]
		CHAR	MUMR_loadID[10]

		CHAR	phantomButtonBedShadesOpenID[10]	// Open Shades
		CHAR	phantomButtonBedShadesStopID[10]	// Stop Shades
		CHAR	phantomButtonBedShadesCloseID[10]	// Close Shades

		CHAR	phantomButtonBedBlackoutOpenID[10]	// Open Blackout
		CHAR	phantomButtonBedBlackoutStopID[10]	// Stop Blackout
		CHAR	phantomButtonBedBlackoutCloseID[10]	// Close Blackout
		
		CHAR	phantomButtonBathShadesOpenID[10]	// Open Shades
		CHAR	phantomButtonBathShadesStopID[10]	// Stop Shades
		CHAR	phantomButtonBathShadesCloseID[10]	// Close Shades
		
		CHAR	phantomButtonBathBlackoutOpenID[10]	// Open Blackout
		CHAR	phantomButtonBathBlackoutStopID[10]	// Stop Blackout
		CHAR	phantomButtonBathBlackoutCloseID[10]// Close Blackout

		CHAR	windowsOpenedLedID[10]
		
		FLOAT 	hvacSetpointTemp[ZONE_NB]
		FLOAT 	hvacSetpointTempHot[ZONE_NB]
		FLOAT 	hvacSetpointTempCold[ZONE_NB]
		FLOAT 	hvacRealTemp[ZONE_NB]
		CHAR  	hvacMode[ZONE_NB]
		
/*		FLOAT 	hvacRealTemp[ZONE_NB]
		INTEGER	hvacPower[ZONE_NB]
		INTEGER	hvacSpeed[ZONE_NB]
		CHAR  	hvacMode[ZONE_NB]
		CHAR	hvacAlarm[ZONE_NB][20]
		CHAR	hvacLocked[ZONE_NB]
		CHAR 	hvacID[ZONE_NB][10]
		CHAR	pollingEnabled
		
		CHAR	welcomeAudio
*/

	/*
		CHAR	LutronIsConnectedToAMX			// COMM. LUTRON SUPERVISION
		CHAR	CrestronIsConnectedToAMX		// COMM. CRESTRON
		CHAR	BssIsConnectedToCrestronSono	// COMM. SONO
		CHAR	LutronIsConnectedToCrestron		// COMM. LUTRON ROOM
	*/
//		CHAR 	chekinIsEnabled
//		CHAR 	occupied
//		CHAR  	cleaningInProcess	

//		INTEGER volumes[ZONE_NB]
	/*	INTEGER volumes_BSS[ZONE_NB]
		INTEGER volumes_TV[ZONE_NB]
		CHAR	volumeLimiteEnabled[ZONE_NB]
		INTEGER vol_start[ZONE_NB]
		INTEGER vol_max[ZONE_NB]
*/

	/*	INTEGER vol_max_BSS[ZONE_NB]
		INTEGER vol_max_TV[ZONE_NB]
		INTEGER vol_start_FB[ZONE_NB]
		INTEGER vol_max_BSS_FB[ZONE_NB]
		INTEGER vol_max_TV_FB[ZONE_NB]
		CHAR 	box_online[ZONE_NB]
		CHAR 	audioMute[ZONE_NB]
		CHAR	tvPower[ZONE_NB]
*/

	//	CHAR 	lutronIP[16]
	
	//		CHAR 	contactFen[ZONE_NB]
	}


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
	// Interfaces
	CONSTANT INTEGER i_ch_Language[NB_LANGUAGE]		= {001,002,003,004,005,006} // FR, EN, RU, ??
	CONSTANT INTEGER i_ch_TP_Mode					= 10
	CONSTANT INTEGER i_ch_Navigation[10]			= {101,102,103,104,105,106,107,108,109,110} // 1>V, 2>A, 3>L, 4>H, 5>S, 6>EXP, .., 10>WLC 
	CONSTANT INTEGER i_ch_Service[10]				= {301,302,303,304,305,306,307,308,309,310} // 1>DND, 2>MUMR

	#IF_DEFINED COMPIL_ALARM_CLOCK
	CONSTANT INTEGER i_ch_AlarmClock[100]	= {	1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450,
												1451,1452,1453,1454,1455,1456,1457,1458,1459,1460,1461,1462,1463,1464,1465,1466,1467,1468,1469,1470,1471,1472,1473,1474,1475,1476,1477,1478,1479,1480,1481,1482,1483,1484,1485,1486,1487,1488,1489,1490,1491,1492,1493,1494,1495,1496,1497,1498,1499,1500}
	#END_IF

	// Audio
	CONSTANT INTEGER a_ch_AudioSrc[20]				= {001,002,003,004,005,006,007,008,009,010,011,012,013,014,015,016,017,018,019,020} // 1-10>Bed - 11-20>Bath
	CONSTANT INTEGER a_ch_AudioGroupSrc[10]			= {101,102,103,104,105,106,107,108,109,110} // 1-5>Bed - 6-10>Bath
	CONSTANT INTEGER a_ch_AudioPwr[2]				= {201,202} // 1>Bed - 2>Bath
	CONSTANT INTEGER a_ch_AudioVolume[10]			= {301,302,303,304,305,306,307,308,309,310}	// 1-3>Bed - 4-6>Bath
	CONSTANT INTEGER a_ch_AudioLink					= 501

	CONSTANT INTEGER a_ch_AudioMatrix[400]			= {1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1147,1148,1149,1150,1151,1152,1153,1154,1155,1156,1157,1158,1159,1160,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1172,1173,1174,1175,1176,1177,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188,1189,1190,1191,1192,1193,1194,1195,1196,1197,1198,1199,1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1238,1239,1240,1241,1242,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,1254,1255,1256,1257,1258,1259,1260,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271,1272,1273,1274,1275,1276,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,1396,1397,1398,1399,1400}
	CONSTANT INTEGER a_ch_VolumeMatrix[10]			= {1501,1502,1503,1504,1505,1506,1507,1508,1509,1510}
	CONSTANT INTEGER a_ch_ZoneMatrix[30]			= {1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614,1615,1616,1617,1618,1619,1620,1621,1622,1623,1624,1625,1626,1627,1628,1629,1630}


	// Video
	CONSTANT INTEGER v_ch_VideoSrc[10]				= {001,002,003,004,005,006,007,008,009,010} // 1-10>Bed - 11-20>Bath
	CONSTANT INTEGER v_ch_VideoGroupSrc[10]			= {101,102,103,104,105,106,107,108,109,110} // 1-5>Bed - 6-10>Bath
	CONSTANT INTEGER v_ch_VideoPwr[2]				= {201,202} // 1>Bed - 2>Bath
	CONSTANT INTEGER v_ch_TV[200]					= {301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500}
	CONSTANT INTEGER v_ch_Art[20]					= {501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520}

	// Lighting
	CONSTANT INTEGER l_ch_LoadCommands[300]		= {101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400}
	CONSTANT INTEGER l_ch_RoomCommands[100]		= {401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500}
	CONSTANT INTEGER l_ch_Light[100]			= {501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600}

	// HVAC
	CONSTANT INTEGER h_ch_SetPointCommands[20]		= {001,002,003,004,005,006,007,008,009,010,011,012,013,014,015,016,017,018,019,020} // +, - / 1-10>Bed - 11-20>Bath

	
	//-----------------------------------------------------------------------------
	// Address codes --------------------------------------------------------------
	//-----------------------------------------------------------------------------
	// Interfaces
	CONSTANT INTEGER i_a_clock					= 2
	
	#IF_DEFINED COMPIL_ALARM_CLOCK
		CONSTANT INTEGER i_ad_AlarmClock[50] 		= {1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450}
		CONSTANT INTEGER i_ad_AlarmClockPlus[50] 	= {1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542,1543,1544,1545,1546,1547,1548,1549,1550}
		CONSTANT INTEGER i_ad_AlarmClockMoins[50] 	= {1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614,1615,1616,1617,1618,1619,1620,1621,1622,1623,1624,1625,1626,1627,1628,1629,1630,1631,1632,1633,1634,1635,1636,1637,1638,1639,1640,1641,1642,1643,1644,1645,1646,1647,1648,1649,1650}
	#END_IF

	//Lighting
	CONSTANT INTEGER l_ad_SceneLevel[2]			= {301,302} // 1>Bed - 2>Bath
	
	// HVAC
	CONSTANT INTEGER h_ad_SetPointValues[20]		= {001,002,003,004,005,006,007,008,009,010,011,012,013,014,015,016,017,018,019,020} // (T)°, (T+0,5)°, (T-0,5)° / 1-10>Bed - 11-20>Bath
	
	//-----------------------------------------------------------------------------
	// Level codes ----------------------------------------------------------------
	//-----------------------------------------------------------------------------
	// Audio
	CONSTANT INTEGER a_l_AudioVolume[2]			= {301,302} // 1>Bed - 2>Bath
	CONSTANT INTEGER a_l_VolumeMatrix			= 401

	//Lighting
	CONSTANT INTEGER l_l_LoadFeedback[100]		= {101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200}
	CONSTANT INTEGER l_l_LoadSlider[100]		= {401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500}
	CONSTANT INTEGER l_l_SceneLevel[2]			= {301,302} // 1>Bed - 2>Bath

	//-----------------------------------------------------------------------------
	// Lutron QSX -----------------------------------------------------------------
	//-----------------------------------------------------------------------------
	VOLATILE CHAR lutronIP[] = '192.168.165.132'

	//-----------------------------------------------------------------------------
	// DSP Chambres Bose EX-1280 --------------------------------------------------
	//-----------------------------------------------------------------------------
	VOLATILE CHAR BoseChambreIP[] = '192.168.165.137'
	VOLATILE CHAR BoseChambreOutput[20]		= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	VOLATILE FLOAT BoseChambreVolume[20]	= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	VOLATILE CHAR BoseChambreMute[20]		= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	VOLATILE CHAR BoseChambrePowerOffInput	= 5
	VOLATILE CHAR BoseChambreZones[20][10]	= {	'200 CH',
												'200 SDB',
												'201 CH',
												'201 SDB',
												'202 CH',
												'202 SDB',
												'203 CH',
												'203 SDB',
												'301 CH',
												'301 SDB',
												'302 CH',
												'302 SDB',
												'303 CH',
												'303 SDB',
												'401 CH',
												'401 SDB',
												'402 CH',
												'402 SDB',
												'403 CH',
												'403 SDB'
											}
												//	Trivum	Play1	Play2	TV		ATV		Chro	Art
	VOLATILE CHAR StartVolume[20][7]		= {	{	50,		50,		50,		50,		50,		50,		50},	//500 CH
												{	50,		50,		50,		50,		50,		50,		50},	//500 SDB
												{	50,		50,		50,		50,		50,		50,		50},	//501 CH
												{	50,		50,		50,		50,		50,		50,		50},	//501 SDB
												{	50,		50,		50,		50,		50,		50,		50},	//502 CH
												{	50,		50,		50,		50,		50,		50,		50},	//502 SDB
												{	50,		50,		50,		50,		50,		50,		50},	//503 CH
												{	50,		50,		50,		50,		50,		50,		50},	//503 SDB
												{	50,		50,		50,		50,		50,		50,		50},	//301 CH
												{	50,		50,		50,		50,		50,		50,		50},	//301 SDB
												{	50,		50,		50,		50,		50,		50,		50},	//302 CH
												{	50,		50,		50,		50,		50,		50,		50},	//302 SDB
												{	50,		50,		50,		50,		50,		50,		50},	//303 CH
												{	50,		50,		50,		50,		50,		50,		50},	//303 SDB
												{	50,		50,		50,		50,		50,		50,		50},	//401 CH
												{	50,		50,		50,		50,		50,		50,		50},	//401 SDB
												{	50,		50,		50,		50,		50,		50,		50},	//402 CH
												{	50,		50,		50,		50,		50,		50,		50},	//402 SDB
												{	50,		50,		50,		50,		50,		50,		50},	//403 CH
												{	50,		50,		50,		50,		50,		50,		50}		//403 SDB
											}

	//-----------------------------------------------------------------------------
	// EONA (Teveo SWI Pack / REST API) -------------------------------------------
	//-----------------------------------------------------------------------------
	CHAR EonaIP[15]					= '192.168.160.180'
	CHAR TerminalsPower[20]			= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	CHAR TerminalsActivity[20][15]	= {' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '}
	CHAR TerminalsChannel[20]		= {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
	INTEGER start_delay				= 0
	CHAR TerminalsIP[20][15]		= {	'10.1.2.113',	//200 // TODO IP
										'10.1.2.110',	//201 // TODO IP
										'10.1.2.111',	//202 // TODO IP
										'10.1.2.112',	//203 // TODO IP
										'10.1.2.59',	//301
										'10.1.2.115',	//302 // TODO IP
										'10.1.2.116',	//303 // TODO IP
										'10.1.2.117',	//401 // TODO IP
										'10.1.2.118',	//402 // TODO IP
										'10.1.2.119' 	//403 // TODO IP
									}

/*
	//-----------------------------------------------------------------------------
	// BSS ------------------------------------------------------------------------
	//-----------------------------------------------------------------------------
	CHAR ZoneSelected = 1
	CHAR BSSipAddress[15] = '192.168.165.135'
*/
	//-----------------------------------------------------------------------------
	// Crestron Bacnet ------------------------------------------------------------
	//-----------------------------------------------------------------------------
	PERSISTENT CHAR CrestronBacnetIsConnectedToAMX
	
	
	//-----------------------------------------------------------------------------
	// ROOMS DATA -----------------------------------------------------------------
	//-----------------------------------------------------------------------------
	PERSISTENT _ROOM rooms[NB_ROOMS]


	//-----------------------------------------------------------------------------
	// Includes -------------------------------------------------------------------
	//-----------------------------------------------------------------------------
	#INCLUDE 'TPs'
	#include 'common_master_code'
	#include 'language'
	#include '_utils'
//	#include 'BYOD'
	#include 'UnicodeLib'
	#include 'Presets_Sat'
	#INCLUDE 'Lutron_Custom_Chambres'	
	#INCLUDE 'Rooms_Custom'
	//#INCLUDE 'BSSControl'
	#INCLUDE 'HVAC_Custom'


DEFINE_MODULE 'Otomis_Eona' 		EonaServer	(vdvEona, dvEona, v_TPTabRooms, v_ch_TV, EonaIP, TerminalsIP, TerminalsPower, TerminalsActivity, TerminalsChannel, start_delay)
DEFINE_MODULE 'Otomis_Bose_comm'	BoseChambre	(vdvBose, dvBose, BoseChambreIP, BoseChambreZones, BoseChambreOutput, BoseChambreVolume, BoseChambreMute, BoseChambrePowerOffInput)
DEFINE_MODULE 'Otomis_LutronQSX_ui' uiLutron 	(vdvLutron, ls_TPTabRooms, l_ch_LoadCommands, l_l_LoadFeedback, l_l_LoadSlider, l_ch_RoomCommands)
#WARN 'Module Otomis_LutronQSX_comm: IF NOT PAIRED, THE COMM MODULE LOCKED FOR 15MIN AMX PROCESSOR AFTER REBOOT <<<<<<<<<<<<<<<<<<<<<'
/*
•	The module is not supported on NI masters
•	The firmware required is 1.6 with minimum patch version as 201 (v1.6.201)
•	The firmware 1.7.xxx and 1.8.xxx are currently not supported
*/
DEFINE_MODULE 'Otomis_LutronQSX_comm' commLutron 		(dvLutron, vdvLutron, vdvDuetLutron, lutronIP)                                                                                 
//#WARN 'MODULE LUTRON QS COMMENTED  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
	
	

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

DEFINE_FUNCTION RefreshTime()
{
	SEND_COMMAND i_TPTabRooms,	"'^TXT-', ITOA(I_A_CLOCK),',0,', LEFT_STRING(TIME, 5)"
}
DEFINE_FUNCTION Refresh_Audio_Page(CHAR num)
{		
	[a_TPTabRooms[num], a_ch_AudioGroupSrc[ 1]] = ((rooms[num].lastZoneAudioActivity[BEDROOM] == 'Airplay') 		|| (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Chromecast'))
	[a_TPTabRooms[num], a_ch_AudioGroupSrc[ 2]] = ((rooms[num].lastZoneAudioActivity[BEDROOM] == 'Playlist 1') 	|| (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Playlist 2'))
	[a_TPTabRooms[num], a_ch_AudioGroupSrc[ 3]] = ((rooms[num].lastZoneAudioActivity[BEDROOM] == 'TV'))

	[a_TPTabRooms[num], a_ch_AudioGroupSrc[ 6]] = ((rooms[num].lastZoneAudioActivity[BATHROOM] == 'Airplay') 	|| (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Chromecast'))
	[a_TPTabRooms[num], a_ch_AudioGroupSrc[ 7]] = ((rooms[num].lastZoneAudioActivity[BATHROOM] == 'Playlist 1') 	|| (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Playlist 2'))
	[a_TPTabRooms[num], a_ch_AudioGroupSrc[ 8]] = ((rooms[num].lastZoneAudioActivity[BATHROOM] == 'TV'))
	
	[a_TPTabRooms[num], a_ch_AudioSrc[ 1]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Airplay')
	[a_TPTabRooms[num], a_ch_AudioSrc[ 2]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Chromecast')
	[a_TPTabRooms[num], a_ch_AudioSrc[ 3]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Playlist 1')
	[a_TPTabRooms[num], a_ch_AudioSrc[ 4]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'Playlist 2')
	[a_TPTabRooms[num], a_ch_AudioSrc[ 5]] = (rooms[num].lastZoneAudioActivity[BEDROOM] == 'TV')
	
	[a_TPTabRooms[num], a_ch_AudioSrc[11]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Airplay')
	[a_TPTabRooms[num], a_ch_AudioSrc[12]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Chromecast')
	[a_TPTabRooms[num], a_ch_AudioSrc[13]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Playlist 1')
	[a_TPTabRooms[num], a_ch_AudioSrc[14]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'Playlist 2')
	[a_TPTabRooms[num], a_ch_AudioSrc[15]] = (rooms[num].lastZoneAudioActivity[BATHROOM] == 'TV')
	
	[a_TPTabRooms[num], a_ch_AudioPwr[ 1]] = ((rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off') && (rooms[num].lastZoneAudioActivity[BEDROOM] != ''))
	
	[a_TPTabRooms[num], a_ch_AudioPwr[ 2]] = ((rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off') && (rooms[num].lastZoneAudioActivity[BATHROOM] != ''))
	
	[a_TPTabRooms[num], a_ch_AudioLink] = ((rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off') && (rooms[num].lastZoneAudioActivity[BEDROOM] != '') && (rooms[num].lastZoneAudioActivity[BEDROOM] == rooms[num].lastZoneAudioActivity[BATHROOM]))
	
	IF(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
		SEND_LEVEL a_TPTabRooms[num], a_l_AudioVolume[BEDROOM], BoseChambreVolume[((num-1)*2)+1]
	ELSE
		SEND_LEVEL a_TPTabRooms[num], a_l_AudioVolume[BEDROOM], 0
		
	IF(rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off')
	{
		SEND_LEVEL a_TPTabRooms[num], a_l_AudioVolume[BATHROOM], BoseChambreVolume[((num-1)*2)+2]
		SEND_COMMAND vdvLutron,"'K:L:',rooms[num].musiqueLedID,':1'"
	}
	ELSE
	{
		SEND_LEVEL a_TPTabRooms[num], a_l_AudioVolume[BATHROOM], 0
		SEND_COMMAND vdvLutron,"'K:L:',rooms[num].musiqueLedID,':0'"
	}
}

DEFINE_FUNCTION Refresh_Video_Page(CHAR num)
{
	[v_TPTabRooms[num], v_ch_VideoGroupSrc[ 1]] = ((rooms[num].lastZoneVideoActivity[1] == 'Airplay Video') || (rooms[num].lastZoneVideoActivity[1] == 'Chromecast Video'))
	
	[v_TPTabRooms[num], v_ch_VideoSrc[ 1]] = (rooms[num].lastZoneVideoActivity[1] == 'TV')
	[v_TPTabRooms[num], v_ch_VideoSrc[ 2]] = (rooms[num].lastZoneVideoActivity[1] == 'Airplay Video')
	[v_TPTabRooms[num], v_ch_VideoSrc[ 3]] = (rooms[num].lastZoneVideoActivity[1] == 'Chromecast Video')
	[v_TPTabRooms[num], v_ch_VideoSrc[ 4]] = (rooms[num].lastZoneVideoActivity[1] == 'Art')
			
	[v_TPTabRooms[num], v_ch_VideoPwr[ 1]] = ((rooms[num].lastZoneVideoActivity[1] != 'Off')	&& (rooms[num].lastZoneVideoActivity[1] != ''))
	
	
	SWITCH(rooms[num].lastZoneVideoActivity[BEDROOM])
	{
		CASE 'TV':					SEND_COMMAND v_TPTabRooms[num], '^PPN-POP DROITE - Video - TV - 1'
		CASE 'Airplay Video':		SEND_COMMAND v_TPTabRooms[num], '^PPN-POP DROITE - Video - ATV'
		CASE 'Chromecast Video':	SEND_COMMAND v_TPTabRooms[num], '^PPN-POP DROITE - Video - Chromecast'
		CASE 'Art':					SEND_COMMAND v_TPTabRooms[num], '^PPN-POP DROITE - Video - ART - 1'
	}
}

DEFINE_FUNCTION Refresh_Experience_Page(CHAR num)
{
	refreshAlarmClock(num)
}

/*
DEFINE_FUNCTION setMute(CHAR zone, CHAR state)
{
	IF (zoneMute[zone] <> state)
	{
		bssSetValue  (dvBSS, bssMuteAddresses[zone], state);
		bssSubscribe (dvBSS, bssMuteAddresses[zone]);
	}
}
*/
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


(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT

	DATA_EVENT[dvAMX]
	{
		ONLINE:
		{			
			TIMELINE_CREATE(TIMELINE_PROGRAM_MAIN, DEFINE_PROGRAM_TIMES, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)
			TIMELINE_CREATE(TIMELINE_EVERY_MINUTE, EVERY_MINUTE_TIMES, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)
			
			IP_SERVER_OPEN(dvCrestron_Bacnet.PORT, 25000, IP_TCP)
			
			CALL 'Init_Language'
			CALL 'roomsInit'
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
	
	DATA_EVENT[TPTabPC]
	{
		online:
		{
			stack_var char num

			num = GET_LAST(TPTabPC)

			//isTPOnline_PC[num] = true
			
			SEND_COMMAND DATA.DEVICE, 'TPCCMD-QueryProfile'
			WAIT 100 SEND_COMMAND DATA.DEVICE, 'TPCCMD-QueryProfile'
			
			//SEND_COMMAND DATA.DEVICE, '^PPX';
			//SEND_COMMAND DATA.DEVICE, '^PGE-Background';
			//SEND_COMMAND DATA.DEVICE, '^PPN-AUDIO MATRIX RDC';
		}
		
		offline:
		{
			stack_var char num
			
			num = GET_LAST(i_TPTabRooms)
			
			//isTPOnline_PC[num] = false
		}
		
		string:
		{
			local_var char str[200]
			local_var char tab[4][45]
			local_var dev lvTP
			local_var integer i
			local_var integer tp
			
			str = data.text
			lvTP = data.device
			
			tab[1] = ''
			tab[2] = ''
			tab[3] = ''
			tab[4] = ''
			
			//Force slot 1 on iPads
			if (left_string(str, 7) == 'Profile')
			{
				if (remove_string(str, 'TP4FileSlot,', 1) <> '')
				{
					if ((	(lvTP == TPTabPC[1]) ||
							(lvTP == TPTabPC[2]) ||
							(lvTP == TPTabPC[3]) ||
							(lvTP == TPTabPC[4]) ||
							(lvTP == TPTabPC[5]) ||
							(lvTP == TPTabPC[6]) ||
							(lvTP == TPTabPC[7]) ||
							(lvTP == TPTabPC[8]) ||
							(lvTP == TPTabPC[9]) ||
							(lvTP == TPTabPC[10])) && (atoi(left_string(str, 1)) <> 1)) //Slot ID
					{
						send_command lvTP, 'TPCCMD-1;TP4FileSlot,1;'
					}
				}
			}
		}
	}
	
	DATA_EVENT[i_TPTabRooms]
	{
		online:
		{
			stack_var char num

			num = GET_LAST(i_TPTabRooms)

			isTPOnlineRooms[num] = true

			SEND_COMMAND i_TPTabRooms[num], "'^AFP-_Home'"
			SEND_COMMAND i_TPTabRooms[num], "'^PPA-Background'"
			
			if(rooms[num].appLanguage == 0)
				rooms[num].appLanguage = FR
			
			[i_TPTabRooms[num], i_ch_TP_Mode] = (rooms[num].TP_mode)
			
			RefreshLanguage(data.device, rooms[num].appLanguage)
		}
		
		offline:
		{
			stack_var char num
			
			num = GET_LAST(i_TPTabRooms)
			
			isTPOnlineRooms[num] = false
		}
	}

	DATA_EVENT[vdvBose]
	{
		STRING:
		{
			STACK_VAR CHAR str[300]
			STACK_VAR CHAR tab[10][30], zone, num
			str = UPPER_STRING(DATA.TEXT)
						
			StringSplit(str, ':', tab)
			
			SWITCH (tab[1])
			{
				CASE 'VOLUME':
				{
					num = (atoi(tab[2])+1)/2
					zone = 2 - (atoi(tab[2]) % 2)
					
					IF(rooms[num].lastZoneAudioActivity[zone] != 'Off')
						SEND_LEVEL a_TPTabRooms[num], a_l_AudioVolume[zone], atoi(tab[3])
				}
			}				
		}
	}

	DATA_EVENT[dvCrestron_Bacnet]		
	{
		ONLINE: 
		{			
			stack_var char i
			
			CrestronBacnetIsConnectedToAMX = TRUE

			for(i=1;i<=NB_ROOMS;i++)
			{
				pollHVAC(i)
			}
		}

		OFFLINE: 
		{					
			CrestronBacnetIsConnectedToAMX = FALSE
			
			IP_SERVER_OPEN(DATA.DEVICE.PORT, 25000, IP_TCP)
		}
		
		STRING:
		{	
			LOCAL_VAR CHAR bufCrestron[2000]
			
			CrestronBacnetIsConnectedToAMX = TRUE
			
			bufCrestron = "bufCrestron, DATA.TEXT"
			WHILE (FIND_STRING(bufCrestron, "$0A", 1) != 0)
				processCrestronBacnetFbk(REMOVE_STRING(bufCrestron, "$0A", 1))
		}
	}
	
	BUTTON_EVENT[i_TPTabRooms,i_ch_TP_Mode]
	{
		PUSH:
		{	
			stack_var char num
			
			num = TPNumberRooms(button.input.device)
			
			rooms[num].TP_mode = !rooms[num].TP_mode
			
			[i_TPTabRooms[num], i_ch_TP_Mode] = (rooms[num].TP_mode)
			
			if(rooms[num].TP_mode)
				SEND_COMMAND button.input.device,	"'^TXT-', ITOA(ADDR_MODE),',0,', 	TEXT_START[rooms[num].appLanguage][ADDR_MODE_JOUR - ADDR_START_OFFSET]"
			else
				SEND_COMMAND button.input.device,	"'^TXT-', ITOA(ADDR_MODE),',0,', 	TEXT_START[rooms[num].appLanguage][ADDR_MODE_NUIT - ADDR_START_OFFSET]"
		}
	}
		
	BUTTON_EVENT[i_TPTabRooms,i_ch_Navigation]
	{
		PUSH:
		{		
			stack_var char num
			
			num = TPNumberRooms(button.input.device)
			
			SWITCH(GET_LAST(i_ch_Navigation))
			{
				CASE 1:	Refresh_Video_Page(num)
				CASE 2:	Refresh_Audio_Page(num)
				CASE 3:	Refresh_Light_Page(num)
				CASE 4:	Refresh_HVAC_Page(num)
				//CASE 5:	Refresh_Shades_Page(num)
				CASE 6:	Refresh_Experience_Page(num)
				CASE 10:{}
			}
			
			OFF[i_TPTabRooms, i_ch_Navigation]
			ON[i_TPTabRooms, BUTTON.INPUT.CHANNEL]
		}
	}
	BUTTON_EVENT[a_TPTabRooms,a_ch_AudioSrc]
	{
		PUSH:
		{		
			local_var char num
			
			num = TPNumberRooms(button.input.device)
			
			SWITCH(GET_LAST(a_ch_AudioSrc))
			{
				// BEDROOM
				CASE 1:
				{
					rooms[num].lastZoneAudioActivity[BEDROOM] = 'Airplay'
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':1'"	// Trivum
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_AIRPLAY])"
				}
				CASE 2:
				{					
					rooms[num].lastZoneAudioActivity[BEDROOM] = 'Chromecast'
					rooms[num].lastZoneVideoActivity[BEDROOM] = 'Chromecast Video'
					
					IF(TerminalsPower[num])
						SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':CHROMECAST'"
					ELSE
					{
						SEND_COMMAND vdvEona, "'POWER:',itoa(num),':ON'"
						wait 100 SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':CHROMECAST'"
						SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPN-Wait TV'
					}
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':4'"	// TV Chambre
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_CHROMECAST])"					
				}
				CASE 3:
				{
					rooms[num].lastZoneAudioActivity[BEDROOM] = 'Playlist 1'
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':2'"	// Player#1
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_PLAYER1])"
				}
				CASE 4:
				{
					rooms[num].lastZoneAudioActivity[BEDROOM] = 'Playlist 2'
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':3'"	// Player#2
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_PLAYER2])"
				}
				CASE 5:
				{			
					IF(rooms[num].lastZoneVideoActivity[BEDROOM] == 'Off')
					{
						rooms[num].lastZoneVideoActivity[BEDROOM] = 'TV'
						rooms[num].lastZoneAudioActivity[BEDROOM] = 'TV'
						
						IF(TerminalsPower[num])
							SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':TV'"
						ELSE
						{
							SEND_COMMAND vdvEona, "'POWER:',itoa(num),':ON'"
							wait 100 SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':TV'"
							SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPN-Wait TV'
						}
						
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
						SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':4'"	// TV Chambre
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_TV])"
					
						wait 2 Refresh_Audio_Page(num)
					}
					ELSE	
					{
						rooms[num].lastZoneAudioActivity[BEDROOM] = 'TV'
						
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
						SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':4'"	// TV Chambre
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_TV])"
					}
				}
				
				// BATHROOM
				CASE 11:
				{
					rooms[num].lastZoneAudioActivity[BATHROOM] = 'Airplay'
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+2),':1'"	// Trivum
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':',itoa(StartVolume[2*(num-1)+2][VOL_AIRPLAY])"
				}
				CASE 12:
				{
					rooms[num].lastZoneAudioActivity[BATHROOM] = 'Chromecast'
					rooms[num].lastZoneVideoActivity[BEDROOM] = 'Chromecast Video'
					
					IF(TerminalsPower[num])
						SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':CHROMECAST'"
					ELSE
					{
						SEND_COMMAND vdvEona, "'POWER:',itoa(num),':ON'"
						wait 100 SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':CHROMECAST'"
						SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPN-Wait TV'
					}
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+2),':4'"	// TV Chambre
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':',itoa(StartVolume[2*(num-1)+2][VOL_CHROMECAST])"
				}
				CASE 13:
				{
					rooms[num].lastZoneAudioActivity[BATHROOM] = 'Playlist 1'
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+2),':2'"	// Player#1
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':',itoa(StartVolume[2*(num-1)+2][VOL_PLAYER1])"
				}
				CASE 14:
				{
					rooms[num].lastZoneAudioActivity[BATHROOM] = 'Playlist 2'
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+2),':3'"	// Player#2
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':',itoa(StartVolume[2*(num-1)+2][VOL_PLAYER2])"
				}
				CASE 15:
				{
					IF(rooms[num].lastZoneVideoActivity[BEDROOM] == 'Off')
					{
						rooms[num].lastZoneVideoActivity[BEDROOM] = 'TV'

						IF(TerminalsPower[num])
							SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':TV'"
						ELSE
						{
							SEND_COMMAND vdvEona, "'POWER:',itoa(num),':ON'"
							wait 100 SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':TV'"
							SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPN-Wait TV'
						}
					}
					
					rooms[num].lastZoneAudioActivity[BATHROOM] = 'TV'
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+2),':4'"	// TV Chambre
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':',itoa(StartVolume[2*(num-1)+2][VOL_TV])"
				}
			}
			
			Refresh_Audio_Page(num)
		}
	}	

	BUTTON_EVENT[a_TPTabRooms,a_ch_AudioPwr]
	{
		PUSH:
		{		
			stack_var char num
			
			num = TPNumberRooms(button.input.device)
			
			SWITCH(GET_LAST(a_ch_AudioPwr))
			{
				// BEDROOM
				CASE 1:
				{
					if(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
					{
						rooms[num].lastZoneAudioActivity[BEDROOM]  = 'Off'
						
						SEND_COMMAND vdvBose, "'POWER:',itoa(2*(num-1)+1),':OFF'"
					}
				}
				// BATHROOM
				CASE 2:
				{
					if(rooms[num].lastZoneAudioActivity[BATHROOM]  != 'Off')
					{
						rooms[num].lastZoneAudioActivity[BATHROOM]  = 'Off'
						
						SEND_COMMAND vdvBose, "'POWER:',itoa(2*(num-1)+2),':OFF'"
					}
				}
			}
			
			Refresh_Audio_Page(num)
		}
	}

	BUTTON_EVENT[a_TPTabRooms,a_ch_AudioLink]
	{
		PUSH:
		{		
			stack_var char num, button_channel
			
			num = TPNumberRooms(button.input.device)
			
			if(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
			{				
				SWITCH(rooms[num].lastZoneAudioActivity[BEDROOM])
				{
					CASE 'Airplay': 	button_channel = 11
					CASE 'Chromecast': 	button_channel = 12
					CASE 'Playlist 1': 	button_channel = 13
					CASE 'Playlist 2': 	button_channel = 14
					CASE 'TV': 			button_channel = 15
				}
				
				DO_PUSH(button.input.device, button_channel)
			}
			else if(rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off')
			{				
				SWITCH(rooms[num].lastZoneAudioActivity[BATHROOM])
				{
					CASE 'Airplay': 	button_channel = 1
					CASE 'Chromecast': 	button_channel = 2
					CASE 'Playlist 1': 	button_channel = 3
					CASE 'Playlist 2': 	button_channel = 4
					CASE 'TV': 			button_channel = 5
				}
				
				DO_PUSH(button.input.device, button_channel)
			}
			
			Refresh_Audio_Page(num)
		}
	}	

	BUTTON_EVENT[v_TPTabRooms,v_ch_VideoSrc]
	{
		PUSH:
		{		
			stack_var char num
			local_var char waitnum
			
			num = TPNumberRooms(button.input.device)
			waitnum = num
			
			SWITCH(GET_LAST(v_ch_VideoSrc))
			{
				// BEDROOM
				CASE 1:
				{
					rooms[num].lastZoneVideoActivity[BEDROOM] = 'TV'
					rooms[num].lastZoneAudioActivity[BEDROOM] = 'TV'
					
					IF(TerminalsPower[num])
						SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':TV'"
					ELSE
					{
						SEND_COMMAND vdvEona, "'POWER:',itoa(num),':ON'"
						wait 100 SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(waitnum),':TV'"
						SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPN-Wait TV'
					}
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':4'"	// TV Chambre
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_TV])"
				}
				CASE 2:
				{
					rooms[num].lastZoneVideoActivity[BEDROOM] = 'Airplay Video'
					rooms[num].lastZoneAudioActivity[BEDROOM] = 'TV'
					
					IF(TerminalsPower[num])
						SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':AIRPLAY'"
					ELSE
					{
						SEND_COMMAND vdvEona, "'POWER:',itoa(num),':ON'"
						wait 100 SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(waitnum),':AIRPLAY'"
						SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPN-Wait TV'
					}
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':4'"	// TV Chambre
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_APPLETV])"
				}
				CASE 3:
				{
					rooms[num].lastZoneVideoActivity[BEDROOM] = 'Chromecast Video'
					rooms[num].lastZoneAudioActivity[BEDROOM] = 'TV'
					
					IF(TerminalsPower[num])
						SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':CHROMECAST'"
					ELSE
					{
						SEND_COMMAND vdvEona, "'POWER:',itoa(num),':ON'"
						wait 100 SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(waitnum),':CHROMECAST'"
						SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPN-Wait TV'
					}
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':4'"	// TV Chambre
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_CHROMECAST])"
				}
				CASE 4:
				{
					rooms[num].lastZoneVideoActivity[BEDROOM] = 'Art'
					
					OFF[BUTTON.INPUT.DEVICE,v_ch_Art]
					ON[BUTTON.INPUT.DEVICE,v_ch_Art[1]]
					
					IF(TerminalsPower[num])
						SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':ART:5'"	// ART#1
					ELSE
					{
						SEND_COMMAND vdvEona, "'POWER:',itoa(num),':ON'"
						wait 100 SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(waitnum),':ART:5'"	// ART#1
						SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPN-Wait TV'
					}
					
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':2'"
					SEND_COMMAND vdvBose, "'SELECTOR:',itoa(2*(num-1)+1),':4'"	// TV Chambre
					SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':',itoa(StartVolume[2*(num-1)+1][VOL_ART])"
				}
			}
			
			Refresh_Video_Page(num)
		}
	}
	BUTTON_EVENT[v_TPTabRooms,v_ch_VideoPwr]
	{
		PUSH:
		{		
			stack_var char num
			
			num = TPNumberRooms(button.input.device)
			
			SWITCH(GET_LAST(v_ch_VideoPwr))
			{
				// BEDROOM
				CASE 1:
				{
					if(rooms[num].lastZoneVideoActivity[BEDROOM] != 'Off')
					{
						rooms[num].lastZoneVideoActivity[BEDROOM] = 'Off'
						rooms[num].lastZoneAudioActivity[BEDROOM] = 'Off'
						
						SEND_COMMAND vdvEona, "'POWER:',itoa(num),':OFF'"
					
						SEND_COMMAND vdvBose, "'POWER:',itoa(2*(num-1)+1),':OFF'"
					}
				}
			}
			
			Refresh_Video_Page(num)
		}
	}	

	BUTTON_EVENT[v_TPTabRooms,v_ch_Art]
	{
		PUSH:
		{		
			stack_var char num
			
			num = TPNumberRooms(button.input.device)
			
			SWITCH(GET_LAST(v_ch_Art))
			{
				CASE 1:	SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':ART:5'"	// ART#1
				CASE 2:	SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':ART:6'"	// ART#2
				CASE 3:	SEND_COMMAND vdvEona, "'ACTIVITY:',itoa(num),':ART:7'"	// ART#3
			}
			
			OFF[BUTTON.INPUT.DEVICE,v_ch_Art]
			ON[BUTTON.INPUT.DEVICE,BUTTON.INPUT.CHANNEL]
		}
	}

	BUTTON_EVENT[a_TPTabRooms,a_ch_AudioVolume]
	{
		PUSH:
		{		
			stack_var char num
			
			num = TPNumberRooms(button.input.device)
			
			switch (GET_LAST(a_ch_AudioVolume))
			{
				//-----------------------------------------------------------
				// BEDROOM --------------------------------------------------
				//-----------------------------------------------------------
				case 1:
				{
					IF(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
					{
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':DOWN'"
					}
				}
				
				case 2:
				{
					IF(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
					{
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':UP'"
					}
				}
				
				case 3:
				{
					IF(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':MUTE:TOGGLE'"
				}

				//-----------------------------------------------------------
				// BATHROOM -------------------------------------------------
				//-----------------------------------------------------------
				case 4:
				{
					IF(rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off')
					{
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':DOWN'"
					}
				}
				
				case 5:
				{
					IF(rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off')
					{
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':UP'"
					}
				}
				
				case 6:
				{
					IF(rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off')
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':MUTE:TOGGLE'"
				}
			}
		}
		
		HOLD[3,REPEAT]:
		{		
			stack_var char num
			
			num = TPNumberRooms(button.input.device)
			
			switch (GET_LAST(a_ch_AudioVolume))
			{
				//-----------------------------------------------------------
				// BEDROOM --------------------------------------------------
				//-----------------------------------------------------------
				case 1:
				{
					IF(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
					{
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':DOWN'"
					}
				}
				
				case 2:
				{
					IF(rooms[num].lastZoneAudioActivity[BEDROOM] != 'Off')
					{
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+1),':UP'"
					}
				}

				//-----------------------------------------------------------
				// BATHROOM -------------------------------------------------
				//-----------------------------------------------------------
				case 4:
				{
					IF(rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off')
					{
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':DOWN'"
					}
				}
				
				case 5:
				{
					IF(rooms[num].lastZoneAudioActivity[BATHROOM] != 'Off')
					{
						SEND_COMMAND vdvBose, "'VOLUME:',itoa(2*(num-1)+2),':UP'"
					}
				}
			}
		}
	}
	
/*
	BUTTON_EVENT[i_TPTabRooms,1600]
	{
		HOLD[20]:
		{
			SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPX';
			SEND_COMMAND BUTTON.INPUT.DEVICE, '^PGE-Background';
			SEND_COMMAND BUTTON.INPUT.DEVICE, '^PPN-AUDIO MATRIX RDC';
		}
	}
	
	BUTTON_EVENT[a_TPTabRooms,a_ch_AudioMatrix]
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

	BUTTON_EVENT[a_TPTabRooms,a_ch_ZoneMatrix]
	{
		PUSH:
		{
			ZoneSelected = GET_LAST(a_ch_ZoneMatrix)
			
			IF(ZoneSelected == 30)
				ZoneSelected = 0
			
			RefreshMatrix(BUTTON.INPUT.DEVICE)
		}
	}
	
	BUTTON_EVENT[a_TPTabRooms, a_ch_VolumeMatrix]
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
*/	
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

		for(i=1;i<=EFFECTIVE_TP_NB_ROOMS;i++)
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
						// les stores s'ouvrent
						shade(ls_TPTabRooms[i], 'Bedroom', 'Blackout', 'Open')
						
						// la lumière s'allume à faible intensité
						SEND_COMMAND vdvLutron, "'K:P:',rooms[i].wakeupButtonID"
						//DO_PUSH(ls_TPTabRooms[i], l_ch_Light[4])
						//DO_PUSH(ls_TPTabRooms[i], l_ch_Light[11])
						
						// une musique douce s'allume --> Quelle musique?
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
						shade(ls_TPTabRooms[i], 'Bedroom', 'Blackout', 'Close')
						shade(ls_TPTabRooms[i], 'Bedroom', 'Shades', 'Close')
						
						SEND_COMMAND vdvLutron, "'K:P:',rooms[i].goodnightButtonID"
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
						// Début: si on est dans le créneau horaire défini, seules quelques lumières s'allument
						DO_PUSH(ls_TPTabRooms[i], l_ch_Light[7])
						DO_PUSH(ls_TPTabRooms[i], l_ch_Light[14])
						
						// la musique se baisse --> Quelle musique?
						// TODO
						
						// le chaud/froid passe à 19*	
						rooms[i].hvacSetpointTempHot[BEDROOM] = 19.0
						IF(rooms[i].hvacMode == HVAC_MODE_HEAT)
							sendToCrestronBacnet("'GTC@',itoa(rooms[i].number),'@SETPOINT_HOT@1900'")					
						ELSE IF(rooms[i].hvacMode == HVAC_MODE_COOL)
							sendToCrestronBacnet("'GTC@',itoa(rooms[i].number),'@SETPOINT_COL@1900'")							
						Refresh_HVAC_Page(i)
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
						// --> Que se passe t'il?
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
		
		refreshTime();
		
		// TODO - Poll TV Power Status
		IF(TerminalsPower[5] == FALSE)
			SEND_COMMAND vdvEona, "'STATUS:5:?'"
	}
	
	TIMELINE_EVENT[TIMELINE_PROGRAM_MAIN]
	{
		stack_var char i,j

		for(i=1;i<=EFFECTIVE_TP_NB_ROOMS;i++)
		{
			//---------------------------------------------------
			// DND & MUMR ---------------------------------------
			//---------------------------------------------------
			[i_TPTabRooms[i], i_ch_Service[ 1]] = (rooms[i].dndEnabled)
			[i_TPTabRooms[i], i_ch_Service[ 2]] = (rooms[i].mumrEnabled)
			
			[a_TPTabRooms[i], a_ch_AudioVolume[ 3]] = (BoseChambreMute[((i-1)*2)+1])
			[a_TPTabRooms[i], a_ch_AudioVolume[ 6]] = (BoseChambreMute[((i-1)*2)+2])
			
			//---------------------------------------------------
			// Alarm Clocks -------------------------------------
			//---------------------------------------------------
#IF_DEFINED COMPIL_ALARM_CLOCK

			[i_TPTabRooms[i], i_ch_AlarmClock[5]] 	= (alarmEnabled[i][1])
			[i_TPTabRooms[i], i_ch_AlarmClock[10]] 	= (alarmEnabled[i][2])
			[i_TPTabRooms[i], i_ch_AlarmClock[15]] 	= (alarmEnabled[i][3])
			[i_TPTabRooms[i], i_ch_AlarmClock[20]] 	= (alarmEnabled[i][4])
			[i_TPTabRooms[i], i_ch_AlarmClock[25]] 	= (alarmEnabled[i][5])
			[i_TPTabRooms[i], i_ch_AlarmClock[30]] 	= (alarmEnabled[i][6])
			[i_TPTabRooms[i], i_ch_AlarmClock[35]] 	= (alarmEnabled[i][7])
#END_IF
		}
		
/*
		// Audio Matrix Feedback
		for(i=1;i<=NB_AUDIO_ZONES;i++)
		{	
			for(j=1;j<=NB_AUDIO_SOURCES;j++)
			{	
				[a_TPTabRooms,a_ch_AudioMatrix[((i-1)*20)+j]] = (zoneSource[i] == j)
			}
			[a_TPTabRooms,a_ch_AudioMatrix[((i-1)*20)+20]] = (zoneSource[i] == 0)
		}
*/
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


