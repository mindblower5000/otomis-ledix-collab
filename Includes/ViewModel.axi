PROGRAM_NAME='ViewModel'





DEFINE_CONSTANT


TIMELINE_DEFINE_VIEW_MODEL = 66071



DEFINE_VARIABLE

HOLD_TIME = 100
LONG HOLD_TIMER[EFFECTIVE_TP_NB]

//-----------------------------------------------------------------------------
// Timeline DEFINE_PROGRAM ----------------------------------------------------
//-----------------------------------------------------------------------------
CONSTANT LONG DEFINE_VIEW_UPDATE[1] = {300}


//-----------------------------------------------------------------------------
// Timeline DEFINE_PROGRAM ----------------------------------------------------
//-----------------------------------------------------------------------------

CONSTANT INTEGER 	MAX_CHANNELS_PER_FLOOR = 100

//View FLOOR index
CONSTANT INTEGER 	Etage_SS = 1
CONSTANT INTEGER 	Etage_RDC= 2
CONSTANT INTEGER 	Etage_R1 = 3
CONSTANT INTEGER 	Etage_R2 = 4
CONSTANT INTEGER 	Etage_R3 = 5
CONSTANT INTEGER 	Etage_R4 = 6
CONSTANT INTEGER 	Etage_R5 = 7


//View ACTIVITY index			
CONSTANT INTEGER 	UI_CONTROL	= 1 //unused						
CONSTANT INTEGER 	UI_VIDEO	= 2 
CONSTANT INTEGER 	UI_AUDIO 	= 3
CONSTANT INTEGER 	UI_LIGHT	= 4 
CONSTANT INTEGER 	UI_AC		= 5 
CONSTANT INTEGER 	UI_MOTOR	= 6 
CONSTANT INTEGER 	UI_VENT		= 7 

CONSTANT CHAR ITOSTR[EFFECTIVE_NB_ZONES][3] = {
'01',
'02',
'03',
'04',
'05',
'06',
'07',
'08',
'09',
'10',
'11',
'12',
'13',
'14',
'15',
'16',
'17',
'18',
'19',
'20',
'21',
'22',
'23',
'24',
'25',
'26',
'27'
}



CONSTANT CHAR ACTIVITY[7][15] = {
'Control',			
'Video',      		
'Audio',       		
'Lighting',         	
'AC',         	
'Motor',         	
'Ventilation'          	
}

//LEFT MENU LEVEL 1
CONSTANT INTEGER 	UI_SRC_L1_V_TV		= 1  	// 141 
CONSTANT INTEGER 	UI_SRC_L1_V_PHONE	= 2     // 142
CONSTANT INTEGER 	UI_SRC_L1_V_ART		= 3     // 143
CONSTANT INTEGER 	UI_SRC_L1_V_PRESENT	= 4     // 144 //BARCO
CONSTANT INTEGER 	UI_SRC_L1_V_USB		= 5     // 145 
CONSTANT INTEGER 	UI_SRC_L1_V_PC		= 6     // 146
CONSTANT INTEGER 	UI_SRC_L1_V_CAM		= 7     // 147                                                           
                                                           
CONSTANT INTEGER 	UI_SRC_L1_A_LEDIX	= 8     // 148  //Massive
CONSTANT INTEGER 	UI_SRC_L1_A_AIR		= 9     // 149  //Massive
CONSTANT INTEGER 	UI_SRC_L1_A_BT		= 10    // 150
CONSTANT INTEGER 	UI_SRC_L1_A_Son		= 11    // 151	//Massive TV Sound
CONSTANT INTEGER 	UI_SRC_L1_A_RCA		= 12    // 152
CONSTANT INTEGER 	UI_SRC_L1_A_Ecran	= 13    // 153
CONSTANT INTEGER 	UI_SRC_L1_A_Son2	= 14    // 154  //Mic if only one page
CONSTANT INTEGER 	UI_SRC_L1_A_BSAudio	= 19    // 159  //BSAudio                                               
                                                          
//SUBMENU  
CONSTANT INTEGER 	UI_SRC_L2_V_ATV		= 21     // 161
CONSTANT INTEGER 	UI_SRC_L2_V_ANDROID	= 22     // 162
CONSTANT INTEGER 	UI_SRC_L2_V_BS		= 23     // 163
CONSTANT INTEGER 	UI_SRC_L2_V_BS2		= 24     // 164
CONSTANT INTEGER 	UI_SRC_L2_V_MSHUB	= 25     // 165

CONSTANT INTEGER 	UI_SRC_L2_A_LEDIX	= 31     // 171
CONSTANT INTEGER 	UI_SRC_L2_A_LEDIX2	= 32     // 172
CONSTANT INTEGER 	UI_SRC_L2_A_AIR		= 33     // 173
CONSTANT INTEGER 	UI_SRC_L2_A_AIR2	= 34     // 174
CONSTANT INTEGER 	UI_SRC_L2_A_TV		= 35     // 175
CONSTANT INTEGER 	UI_SRC_L2_A_TV2		= 36     // 176 
CONSTANT INTEGER 	UI_SRC_L2_A_SON		= 37     // 177 //BrightSign Audio
CONSTANT INTEGER 	UI_SRC_L2_A_SON2	= 38     // 178 //pcaudio shiseido, ecran
CONSTANT INTEGER 	UI_SRC_L2_A_HOLO	= 39     // 179 

CONSTANT INTEGER 	UI_SRC_L1_V_OFF		= 41    // 181	
CONSTANT INTEGER 	UI_SRC_L1_A_OFF		= 42    // 182	
CONSTANT INTEGER 	UI_SRC_L2_V_OFF		= 43    // 183	
CONSTANT INTEGER 	UI_SRC_L2_A_OFF		= 44    // 184	

//PANEL ACTIVITIES 1001-1700
CONSTANT INTEGER i_ch_Panel_SS [MAX_CHANNELS_PER_FLOOR]	= {1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100}
CONSTANT INTEGER i_ch_Panel_RDC[MAX_CHANNELS_PER_FLOOR]	= {1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1129,1130,1131,1132,1133,1134,1135,1136,1137,1138,1139,1140,1141,1142,1143,1144,1145,1146,1147,1148,1149,1150,1151,1152,1153,1154,1155,1156,1157,1158,1159,1160,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1172,1173,1174,1175,1176,1177,1178,1179,1180,1181,1182,1183,1184,1185,1186,1187,1188,1189,1190,1191,1192,1193,1194,1195,1196,1197,1198,1199,1200}
CONSTANT INTEGER i_ch_Panel_R1 [MAX_CHANNELS_PER_FLOOR]	= {1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1238,1239,1240,1241,1242,1243,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,1254,1255,1256,1257,1258,1259,1260,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271,1272,1273,1274,1275,1276,1277,1278,1279,1280,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300}
CONSTANT INTEGER i_ch_Panel_R2 [MAX_CHANNELS_PER_FLOOR]	= {1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,1336,1337,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,1396,1397,1398,1399,1400}
CONSTANT INTEGER i_ch_Panel_R3 [MAX_CHANNELS_PER_FLOOR]	= {1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1411,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450,1451,1452,1453,1454,1455,1456,1457,1458,1459,1460,1461,1462,1463,1464,1465,1466,1467,1468,1469,1470,1471,1472,1473,1474,1475,1476,1477,1478,1479,1480,1481,1482,1483,1484,1485,1486,1487,1488,1489,1490,1491,1492,1493,1494,1495,1496,1497,1498,1499,1500}
CONSTANT INTEGER i_ch_Panel_R4 [MAX_CHANNELS_PER_FLOOR]	= {1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542,1543,1544,1545,1546,1547,1548,1549,1550,1551,1552,1553,1554,1555,1556,1557,1558,1559,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1570,1571,1572,1573,1574,1575,1576,1577,1578,1579,1580,1581,1582,1583,1584,1585,1586,1587,1588,1589,1590,1591,1592,1593,1594,1595,1596,1597,1598,1599,1600}
CONSTANT INTEGER i_ch_Panel_R5 [MAX_CHANNELS_PER_FLOOR]	= {1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614,1615,1616,1617,1618,1619,1620,1621,1622,1623,1624,1625,1626,1627,1628,1629,1630,1631,1632,1633,1634,1635,1636,1637,1638,1639,1640,1641,1642,1643,1644,1645,1646,1647,1648,1649,1650,1651,1652,1653,1654,1655,1656,1657,1658,1659,1660,1661,1662,1663,1664,1665,1666,1667,1668,1669,1670,1671,1672,1673,1674,1675,1676,1677,1678,1679,1680,1681,1682,1683,1684,1685,1686,1687,1688,1689,1690,1691,1692,1693,1694,1695,1696,1697,1698,1699,1700}


//LEFT MENU 1-20 LEVEL 1
//LEFT MENU 21-40 LEVEL 2
CONSTANT INTEGER i_ch_LeftMenuState [50] = {141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190}


CONSTANT INTEGER LEFT_MENU_BUTTON_1 = 1
CONSTANT INTEGER LEFT_MENU_BUTTON_2 = 2
CONSTANT INTEGER LEFT_MENU_BUTTON_3 = 3
CONSTANT INTEGER LEFT_MENU_BUTTON_4 = 4
CONSTANT INTEGER LEFT_SUBMENU_BUTTON_1 = 5
CONSTANT INTEGER LEFT_SUBMENU_BUTTON_2 = 6
CONSTANT INTEGER LEFT_SUBMENU_BUTTON_3 = 7
CONSTANT INTEGER LEFT_SUBMENU_BUTTON_4 = 8
//ViewModel panel state data 
//!!!  50 activities per floor !!! 7 floors
INTEGER activityViewState[7][100] //


/*
    Update ModelViewState - View    
     
*/
DEFINE_FUNCTION syncViewModel()
{	
    LOCAL_VAR INTEGER act_count
    
    //PLAN VIEW SYNC
    FOR (  act_count=1; act_count <= MAX_CHANNELS_PER_FLOOR; act_count ++)
	[TPTabPC, i_ch_Panel_SS[act_count]] = activityViewState[Etage_SS][act_count]
	
    FOR (  act_count=1; act_count <= MAX_CHANNELS_PER_FLOOR; act_count ++)
	[TPTabPC, i_ch_Panel_RDC[act_count]] = activityViewState[Etage_RDC][act_count]
	
    FOR (  act_count=1; act_count <= MAX_CHANNELS_PER_FLOOR; act_count ++)
	[TPTabPC, i_ch_Panel_R1[act_count]] = activityViewState[Etage_R1][act_count]
	
    FOR (  act_count=1; act_count <= MAX_CHANNELS_PER_FLOOR; act_count ++)
	[TPTabPC, i_ch_Panel_R2[act_count]] = activityViewState[Etage_R2][act_count]
	
    FOR (  act_count=1; act_count <= MAX_CHANNELS_PER_FLOOR; act_count ++)
	[TPTabPC, i_ch_Panel_R3[act_count]] = activityViewState[Etage_R3][act_count]
	
    FOR (  act_count=1; act_count <= MAX_CHANNELS_PER_FLOOR; act_count ++)
	[TPTabPC, i_ch_Panel_R4[act_count]] = activityViewState[Etage_R4][act_count]
	
    FOR (  act_count=1; act_count <= MAX_CHANNELS_PER_FLOOR; act_count ++)
	[TPTabPC, i_ch_Panel_R5[act_count]] = activityViewState[Etage_R5][act_count]
	
    //SOURCE VIEW SYNC
    //FOR (  act_count=1; act_count <= MAX_CHANNELS_PER_FLOOR; act_count ++)
	//[TPTabPC, i_ch_Panel_R5[act_count]] = activityViewState[Etage_R5][act_count]
   
	

}



DEFINE_FUNCTION UpdateRoomLeftMenuState(DEV dvTP, INTEGER ui_src_index)
{	

    STACK_VAR INTEGER zone_id_to_show
    zone_id_to_show = 0
    zone_id_to_show = GetZoneIdByName(lastZoneSelectedInTP[GetDevIndex(dvTP)])
    
    
    //debug(AMX_DEBUG, "'RoomUpdateMenuState :: Zone ', ZONELIST[zone_id_to_show], ' SRC:',ZoneSourceSelected[zone_id_to_show]")
    
    //Building the state according to the selected source
    
    SWITCH(ZoneSourceSelectedVideo[zone_id_to_show])
    {
	//VIDEO

	CASE 'Off'               :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_OFF]] = true 		
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
	}  
	CASE 'TNT'               :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_TV]] = true 		
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
	}    
	CASE 'ATV' 		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_PHONE]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_ATV]] = true 
	}
	CASE 'Android' 		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_PHONE]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_ANDROID]] = true 
	}	
	CASE 'BS'		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_ART]] = true 		
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_BS]] = true 
	}	
	CASE 'BS2'		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_ART]] = true 		
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_BS2]] = true 
	}	
	CASE 'PC'		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_PC]] = true 		
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
	}
	CASE 'Barco'		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_PRESENT]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
	}
	CASE 'HUB'		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_ART]] = true 		
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_MSHUB]] = true 
	}
	CASE 'CAM'		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_CAM]] = true 		
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
	}	     
	CASE 'USB'		:
	{ 
		[dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_V_USB]] = true 		
		[dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
	}
	}
	
	SWITCH(ZoneSourceSelectedAudio[zone_id_to_show])
    {    
	//AUDIO ---------------------------

	CASE 'Off'               :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_OFF]] = true 		
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_OFF]] = true 
	} 
	CASE 'LeDix' 		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_LEDIX]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_LEDIX]] = true 
	}
	CASE 'LeDix2' 		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_LEDIX]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_LEDIX2]] = true
	}

	CASE 'PCAudio'          :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON]] = true 
	}
	CASE 'BSAudio'		:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_BSAudio]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON2]] = true 
	}        
	CASE 'Airplay'          :
	{
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_AIR]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_AIR]] = true 
	}
	CASE 'Airplay2' 	:
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_AIR]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_AIR]] = true 
	}	
	CASE 'BT'               :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_BT]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_OFF]] = true 
	}
	CASE 'RCA'               :
	{ 
		[dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_RCA]] = true 	
		[dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_OFF]] = true 
	}
	CASE 'TVE'              :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_TV]] = true 
	}
	CASE 'TV'           : //Son de la TV
	{ 
		[dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
		[dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_TV]] = true 
	}
	CASE 'Son'              :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON2]] = true 
	}
	CASE 'TVT'              :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_TV2]] = true
	}
	CASE 'SonT'             :
	CASE 'Son2'         : //MIC 2nd level Jardin, 
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON2]] = true
	}
	CASE 'SonE' 		: //Salle Eiffel 
	{ 
		[dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
		[dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON]] = true 
	}
	CASE 'HOLO'             :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_HOLO]] = true 
	}
	CASE 'Ecran'	        :
	{ 
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
	    [dvTP, i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON2]] = true 
	}
    }
    
}





DEFINE_FUNCTION ViewControl	(DEV dvTP, CHAR zone[], CHAR action_name[50], INTEGER etage, INTEGER act_index)
{

//Dummy function
    debug(AMX_DEBUG, "'ViewControl :: Doing nothing : Activity =', action_name")

}


/*
    Handler for panel activities, HOLD event
*/
DEFINE_FUNCTION  ActivityHoldRouting(DEV dvTP, INTEGER etage, INTEGER activity_index)
{
	/*
	SEND_COMMAND dvTP, '@PPX'
	SEND_COMMAND dvTP, '^PGE-FULL - 07 - SS - Shiseido
	SEND_COMMAND dvTP, '^PPG-VID - Z07 - SS - Shiseido
	SEND_COMMAND dvTP, '^PPG-SRC - LOGO
	SEND_STRING dvTP, 'ACT@Video'
	
	LOCAL_VAR zone_global_id
	LOCAL_VAR zone_string[2]
	LOCAL_VAR etage_string[2]
	*/
	


	STACK_VAR INTEGER act, zone
	
	act = (activity_index - 1) % 10 + 1
	zone = GetGlobalZoneByEtageActivity(etage ,activity_index)
	
	debug(AMX_DEBUG, "'ActivityHoldRouting :: ',FLOORLIST[etage],'[',ITOA(activity_index), '] => ',ZONELIST[zone],'[',ACTIVITY[act],']'")
	
	
	IF((etage==Etage_SS && (activity_index == 65 || activity_index == 75 || activity_index == 85)) ||
	    (etage==Etage_RDC && activity_index == 5)) 
	{
	    debug(AMX_DEBUG, "'ActivityHoldRouting :: SKIPPING ID 64,75,85. NO PAGES.'")
	    RETURN
	}
	
	
	
	
	SWITCH(act)
	{
	    //CASE UI_CONTROL	: Nutting to do  //CTR
	    CASE UI_VIDEO	:
	    {	
		SEND_COMMAND dvTP, '@PPX'
		SEND_COMMAND dvTP, "'^PGE-FULL - ',ITOSTR[zone],' - ',FLOORLIST[etage],' - ',ZONELIST[zone]"
		SEND_COMMAND dvTP, "'^PPG-VID - Z',ITOSTR[zone],' - ',FLOORLIST[etage],' - ',ZONELIST[zone]"
		SEND_COMMAND dvTP, "'^PPG-SRC - LOGO'"
		WAIT 2 DO_PUSH(dvTP, 101)

	    }

	    CASE UI_AUDIO 	: 
	    {	
		SEND_COMMAND dvTP, '@PPX'
		SEND_COMMAND dvTP, "'^PGE-FULL - ',ITOSTR[zone],' - ',FLOORLIST[etage],' - ',ZONELIST[zone]"
		SEND_COMMAND dvTP, "'^PPG-AUD - Z',ITOSTR[zone],' - ',FLOORLIST[etage],' - ',ZONELIST[zone]"
		SEND_COMMAND dvTP, "'^PPG-SRC - LOGO'"
		WAIT 2 DO_PUSH(dvTP, 102)
		
	    }	    
	    
	    CASE UI_LIGHT	: 
	    {	
		SEND_COMMAND dvTP, '@PPX'
		SEND_COMMAND dvTP, "'^PGE-FULL - ',ITOSTR[zone],' - ',FLOORLIST[etage],	' - ',ZONELIST[zone]"
		SEND_COMMAND dvTP, "'^PPG-LIG - ', ITOSTR[zone],			' - ',ZONELIST[zone]"
		WAIT 2 DO_PUSH(dvTP, 103)
	    }
	    	    
	    
	    CASE UI_AC		:  //HVA - 19 - Eiffel
	    {		
		SEND_COMMAND dvTP, "'^PGE-FULL - ',ITOSTR[zone],' - ',FLOORLIST[etage],	' - ',ZONELIST[zone]"
		SEND_COMMAND dvTP, "'^PPG-HVA - ', ITOSTR[zone],			' - ',ZONELIST[zone]"
		WAIT 2 DO_PUSH(dvTP, 104)
	    }
	    
	    CASE UI_MOTOR	: 
	    {	
		SEND_COMMAND dvTP, '@PPX'
		SEND_COMMAND dvTP, "'^PGE-FULL - ',ITOSTR[zone],' - ',FLOORLIST[etage],	' - ',ZONELIST[zone]"
		SEND_COMMAND dvTP, "'^PPG-SHA - ', ITOSTR[zone],			' - ',ZONELIST[zone]"
		WAIT 2 DO_PUSH(dvTP, 105)
		
	    }
	     
	    
	    DEFAULT:
		debug(AMX_DEBUG, "'ActivityHoldRouting :: Warning :  Activity has no handler =', ITOA(activity_index)")
	}	    
}




DEFINE_FUNCTION INTEGER GetGlobalZoneByEtageActivity(INTEGER etage, INTEGER activity_ch_index)
{
    STACK_VAR INTEGER z
    
    z = (activity_ch_index - 1) / 10 + 1 //Get local zone
    
    SWITCH(etage)
    {
	CASE Etage_SS: z = z + ETAGE_SHIFT[Etage_SS]
	CASE Etage_RDC: z = z + ETAGE_SHIFT[Etage_RDC]
	CASE Etage_R1: z = z + ETAGE_SHIFT[Etage_R1]
	CASE Etage_R5: z = z + ETAGE_SHIFT[Etage_R5]
	
	DEFAULT:
	    debug(AMX_DEBUG, "'GetGlobalZoneByEtageActivity :: Etage is not enlisted. ',ITOA(etage)")
    }
	
    RETURN z

} 



/*
    Handler for panel activities Single Touch
    Single touch RECALL_LAST/OFF
*/
DEFINE_FUNCTION  ActivityTouchRouting(DEV dvTP, INTEGER etage, INTEGER activity_index)
{	

	STACK_VAR INTEGER act, zone
	
	act = (activity_index - 1) % 10 + 1
	zone = GetGlobalZoneByEtageActivity(etage ,activity_index)
	
	debug(AMX_DEBUG, "'ActivityTouchRouting :: ',FLOORLIST[etage],'[',ITOA(activity_index), '] => ',ZONELIST[zone],'[',ACTIVITY[act],']'")
	
	    
	SWITCH(act)
	{
	    CASE UI_CONTROL	: ViewControl		(dvTP, ZONELIST[zone], 'LastState', etage, activity_index) //CTR
	    CASE UI_VIDEO	: Video			(dvTP, ZONELIST[zone], 'LastState', etage, activity_index) //VID
	    CASE UI_AUDIO 	: Audio			(dvTP, ZONELIST[zone], 'LastState', etage, activity_index) //AUD
	    CASE UI_LIGHT	: Scenarios		(dvTP, ZONELIST[zone], 'LastState', etage, activity_index) //LIG
	    //CASE UI_AC		: AC			(dvTP, ZONELIST[zone], 'LastState', etage, activity_index) //AC
	    //CASE UI_MOTOR	: Rideaux		(dvTP, ZONELIST[zone], 'LastState', etage, activity_index) //Rideaux

	    DEFAULT:
		debug(AMX_DEBUG, "'ActivityTouchRouting :: Warning :  Activity has no handler =', ITOA(activity_index)")
	}	    
	
	

}



/*
    Prepare menu channels state for the zone active in iPad dependinf on user selected sources.
    Channels are fixed for source. 
    
    Two levels of menu: //
    See constants used.
    
    Level 1 
    Level 2
*/
DEFINE_FUNCTION syncMenuInAllDevices()
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
		
		SWITCH(ZoneSourceSelectedVideo[zone_id_to_show[cx]]) 		
		{
		//LEVELS SWITCH
		
		//VIDEo ------------------------
		
		CASE 'Off'               :
		{ 
			//OFF LEVEL 1
			//OFF LEVEL 2
		
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_OFF]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
		} 		
		CASE 'TNT'               :
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_TV]] = true 		
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
		}    
		CASE 'ATV' 		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_PHONE]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_ATV]] = true 
		}
		CASE 'Android' 		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_PHONE]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_ANDROID]] = true 
		}	
		CASE 'BS'		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_ART]] = true 		
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_BS]] = true  
		}		
		CASE 'BS2'		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_ART]] = true 		
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_BS2]] = true 
		}	
		CASE 'PC'		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_PC]] = true 		
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
		}
		CASE 'Barco'		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_PRESENT]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
		}
		CASE 'HUB'		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_ART]] = true 		
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_MSHUB]] = true 
		}
		CASE 'CAM'		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_CAM]] = true 		
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
		}	     
		CASE 'USB'		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_V_USB]] = true 		
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_V_OFF]] = true 
		}	     
		}

		SWITCH(ZoneSourceSelectedAudio[zone_id_to_show[cx]]) 		
		{
		//LEVELS SWITCH
		
		//AUDIO ----------------------------------------
		
		CASE 'Off' 		:
		{ 
			//OFF LEVEL 1
			//OFF LEVEL 2

			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_OFF]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_OFF]] = true  
		}
		CASE 'LeDix' 		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_LEDIX]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_LEDIX]] = true 
		}
		CASE 'LeDix2' 		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_LEDIX]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_LEDIX2]] = true
		}
		CASE 'PCAudio'          :
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON2]] = true 
		}
		CASE 'BSAudio'		:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON]] = true 
		}        
		CASE 'Airplay'          :
		{
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_AIR]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_AIR]] = true 
		}
		CASE 'Airplay2' 	:
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_AIR]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_AIR2]] = true 
		}		
		CASE 'BT'               :
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_BT]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_OFF]] = true 
		}		
		CASE 'RCA'               :
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_RCA]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_OFF]] = true 
		}		
		CASE 'TVE'          : // Son de la TV Eiffel
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_TV2]] = true 
		}		
		CASE 'TV'           : //Son de la TV
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_TV]] = true 
		}		
		CASE 'Son'          : //MIC, son salon Eiffel
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son2]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON]] = true 
		}
		CASE 'TVT'              :
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_TV]] = true
		}		
		CASE 'SonT' 		: //Salle Tronquois
		CASE 'Son2'         : //MIC 2nd level Jardin, 
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON2]] = true 
		}
		CASE 'SonE' 		: //Salle Eiffel 
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON]] = true 
		}
		CASE 'HOLO'             :
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_HOLO]] = true 
		}
		CASE 'Ecran'	        :
		{ 
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L1_A_Son]] = true 	
			[TPTabPC[cx], i_ch_LeftMenuSTATE[UI_SRC_L2_A_SON2]] = true 
		}
	}
	}
	}
}	

DEFINE_EVENT


//ZONE PANEL ACTIVITIES HANDLER
BUTTON_EVENT[TPTabPC, i_ch_Panel_SS]
{	

    HOLD[4]: //x100 ms
    {
	    ActivityHoldRouting (BUTTON.INPUT.DEVICE, Etage_SS, GET_LAST(i_ch_Panel_SS))
	    
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
	    IF(Button.Holdtime > HOLD_TIME) //SET LOCK
		HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] = Button.Holdtime
	    
	    //ALOW RELEASE in 1s after hold was pressed
	    SEND_STRING vdvBridge,"'CAST=',DEV_TO_STRING(BUTTON.INPUT.DEVICE),'=CLR@Timers'" 
	    
    }
    
    RELEASE:
    {	
	    IF(HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] <= HOLD_TIME)
		ActivityTouchRouting(BUTTON.INPUT.DEVICE, Etage_SS, GET_LAST(i_ch_Panel_SS))
	   
	    
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
    } 
    
    

}

BUTTON_EVENT[TPTabPC, i_ch_Panel_RDC]
{
    HOLD[4]: //x100 ms
    {
	    ActivityHoldRouting (BUTTON.INPUT.DEVICE, Etage_RDC, GET_LAST(i_ch_Panel_RDC))
	    
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
	    IF(Button.Holdtime > HOLD_TIME) //SET LOCK
		HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] = Button.Holdtime

	    //ALOW RELEASE in 1s after hold was pressed
	    SEND_STRING vdvBridge,"'CAST=',DEV_TO_STRING(BUTTON.INPUT.DEVICE),'=CLR@Timers'"  
    }
    
    RELEASE:
    {	
	    IF(HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] <= HOLD_TIME)
		ActivityTouchRouting(BUTTON.INPUT.DEVICE, Etage_RDC, GET_LAST(i_ch_Panel_RDC))
	    
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
    } 
}

BUTTON_EVENT[TPTabPC, i_ch_Panel_R1]
{
    HOLD[4]: //x100 ms
    {
	    ActivityHoldRouting (BUTTON.INPUT.DEVICE, Etage_R1, GET_LAST(i_ch_Panel_R1))
	    
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
	    IF(Button.Holdtime > HOLD_TIME) //SET LOCK
		HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] = Button.Holdtime
	    
	    //ALOW RELEASE in 1s after hold was pressed
	    SEND_STRING vdvBridge,"'CAST=',DEV_TO_STRING(BUTTON.INPUT.DEVICE),'=CLR@Timers'" 
    }
    
    RELEASE:
    {	
	    IF(HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] <= HOLD_TIME)
		ActivityTouchRouting(BUTTON.INPUT.DEVICE, Etage_R1, GET_LAST(i_ch_Panel_R1))
		
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
    } 
}

BUTTON_EVENT[TPTabPC, i_ch_Panel_R2]
{
    HOLD[4]: //x100 ms
    {
	    ActivityHoldRouting (BUTTON.INPUT.DEVICE, Etage_R2, GET_LAST(i_ch_Panel_R2))
	    
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
	    IF(Button.Holdtime > HOLD_TIME) //SET LOCK
		HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] = Button.Holdtime
	    
	    //ALOW RELEASE in 1s after hold was pressed
	    SEND_STRING vdvBridge,"'CAST=',DEV_TO_STRING(BUTTON.INPUT.DEVICE),'=CLR@Timers'" 
    }
    
    RELEASE:
    {	
	    IF(HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] <= HOLD_TIME)
		ActivityTouchRouting(BUTTON.INPUT.DEVICE, Etage_R2, GET_LAST(i_ch_Panel_R2))
	   
	    debug(AMX_DEBUG, "'RELEASE:', ITOA(Button.Holdtime)")
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
    } 
}

BUTTON_EVENT[TPTabPC, i_ch_Panel_R3]
{
    HOLD[4]: //x100 ms
    {
	    ActivityHoldRouting (BUTTON.INPUT.DEVICE, Etage_R3, GET_LAST(i_ch_Panel_R3))
	    
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
	    IF(Button.Holdtime > HOLD_TIME) //SET LOCK
		HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] = Button.Holdtime
	    
	    //ALOW RELEASE in 1s after hold was pressed
	    SEND_STRING vdvBridge,"'CAST=',DEV_TO_STRING(BUTTON.INPUT.DEVICE),'=CLR@Timers'" 
    }
    
    RELEASE:
    {	
	    IF(HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] <= HOLD_TIME)
		ActivityTouchRouting(BUTTON.INPUT.DEVICE, Etage_R3, GET_LAST(i_ch_Panel_R3))
	   
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
    } 
}

BUTTON_EVENT[TPTabPC, i_ch_Panel_R4]
{
    HOLD[4]: //x100 ms
    {
	    ActivityHoldRouting (BUTTON.INPUT.DEVICE, Etage_R4, GET_LAST(i_ch_Panel_R4))
	    
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
	    IF(Button.Holdtime > HOLD_TIME) //SET LOCK
		HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] = Button.Holdtime
	    
	    //ALOW RELEASE in 1s after hold was pressed
	    SEND_STRING vdvBridge,"'CAST=',DEV_TO_STRING(BUTTON.INPUT.DEVICE),'=CLR@Timers'" 
    }
    
    RELEASE:
    {	
	    IF(HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] <= HOLD_TIME)
		ActivityTouchRouting(BUTTON.INPUT.DEVICE, Etage_R4, GET_LAST(i_ch_Panel_R4))
	   
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
    } 
}


BUTTON_EVENT[TPTabPC, i_ch_Panel_R5]
{
    HOLD[4]: //x100 ms
    {
	    ActivityHoldRouting (BUTTON.INPUT.DEVICE, Etage_R5, GET_LAST(i_ch_Panel_R5))
	    
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
	    IF(Button.Holdtime > HOLD_TIME) //SET LOCK
		HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] = Button.Holdtime
	    
	    //ALOW RELEASE in 1s after hold was pressed
	    SEND_STRING vdvBridge,"'CAST=',DEV_TO_STRING(BUTTON.INPUT.DEVICE),'=CLR@Timers'" 
    }
    
    RELEASE:
    {	
	    IF(HOLD_TIMER[GetDevIndex(BUTTON.INPUT.DEVICE)] <= HOLD_TIME)
		ActivityTouchRouting(BUTTON.INPUT.DEVICE, Etage_R5, GET_LAST(i_ch_Panel_R5))
	   
	    UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, 0)
    } 
}



BUTTON_EVENT[TPTabPC, i_ch_LeftMenuSTATE]
{
    PUSH:
    {
	    WAIT 2 UpdateRoomLeftMenuState(BUTTON.INPUT.DEVICE, GET_LAST(i_ch_LeftMenuSTATE))
	    debug(AMX_DEBUG, "'Left menu selected index:', ITOA(GET_LAST(i_ch_LeftMenuSTATE))")
    }
}


DATA_EVENT[0:1:1]
{
	ONLINE:
	{
		TIMELINE_CREATE(TIMELINE_DEFINE_VIEW_MODEL, DEFINE_VIEW_UPDATE, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)
		
		WAIT 60
		{
			//Other stuff to do at controller's initialization
			
			//Set to AMX_ERROR in production
			//SET_LOG_LEVEL(AMX_DEBUG)

			
		}
	}
}







TIMELINE_EVENT[TIMELINE_DEFINE_VIEW_MODEL]
{
    syncViewModel()
    
    syncMenuInAllDevices()
}


