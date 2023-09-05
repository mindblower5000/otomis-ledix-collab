PROGRAM_NAME='HVAC_Custom'

DEFINE_CONSTANT

TIMELINE_DEFINE_PROGRAM_HVAC_CUSTOM = 54091

HVAC_MODE_HEAT 		= 2
HVAC_MODE_COOL 		= 4
HVAC_MODE_OFF 		= 7

DEFINE_VARIABLE

CONSTANT LONG POLL_TIME[1]				= {60000}

DEFINE_MUTUALLY_EXCLUSIVE

DEFINE_FUNCTION sendToCrestronBacnet(CHAR str[])
{
	SEND_STRING dvCrestron_Bacnet, "str, $0A"
	
	AMX_LOG(AMX_DEBUG, "'Send Crestron Bacnet: ', str")
	SEND_STRING 0,"'Send Crestron Bacnet: ', str"
}
DEFINE_FUNCTION processCrestronBacnetFbk(CHAR str[])
{
	LOCAL_VAR CHAR tab[6][45]
	stack_var CHAR i, index, floor, zone, value
	stack_var INTEGER room_number
	
	str = LEFT_STRING(str, LENGTH_STRING(str) - 1)
	
	AMX_LOG(AMX_INFO, "'Crestron Bacnet: ', str");
	SEND_STRING 0,"'Crestron Bacnet: ', str"

	StringSplit(str, '@', tab)
	
	SWITCH (tab[1])
	{
		CASE 'GTC':
		{			
			room_number = atoi(tab[2])
			zone = 1 // ONLY BEDROOM
			
			for(i=1;i<=NB_ROOMS;i++)
			{
				if(rooms[i].number == room_number)
					index = i
			}

			SWITCH(tab[3])
			{
				CASE 'MODE':		// GTC@301@MODE@HOT
				{					
					rooms[index].hvacMode[zone] = atoi(tab[4])
				}

				CASE 'SETPOINT':	// GTC@301@SETPOINT@21.5
				{					
					rooms[index].hvacSetpointTemp[zone] = atof(tab[4]) / 100
					
					IF(rooms[index].hvacMode[zone] == HVAC_MODE_HEAT)
						rooms[index].hvacSetpointTempHot[zone] = atof(tab[4]) / 100
					ELSE IF(rooms[index].hvacMode[zone] == HVAC_MODE_COOL)
						rooms[index].hvacSetpointTempCold[zone] = atof(tab[4]) / 100
				}
				
				CASE 'TEMP':	// GTC@301@TEMP@21.5
				{					
					rooms[index].hvacRealTemp[zone] = atof(tab[4]) / 100
				}
			}
		}
	}
}

DEFINE_FUNCTION pollHVAC(CHAR index)
{
	sendToCrestronBacnet("'GTC@',itoa(rooms[index].number),'@MODE@?'")
	sendToCrestronBacnet("'GTC@',itoa(rooms[index].number),'@SETPOINT@?'")
	sendToCrestronBacnet("'GTC@',itoa(rooms[index].number),'@TEMP@?'")
}

DEFINE_FUNCTION Refresh_HVAC_Page(CHAR num)
{
	// Bedroom
	
	IF(rooms[num].hvacMode[BEDROOM] <> HVAC_MODE_OFF)	
	{
		SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[1]),',0,',FORMAT('%2.1f',rooms[num].hvacSetpointTemp[BEDROOM])"		
	
		IF(rooms[num].hvacSetpointTemp[BEDROOM] <> 28)
			SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[2]),',0,',FORMAT('%2.1f',rooms[num].hvacSetpointTemp[BEDROOM] + 0.5)"
		ELSE
			SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[2]),',0, '"
		
		IF(rooms[num].hvacSetpointTemp[BEDROOM] <> 16)
			SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[3]),',0,',FORMAT('%2.1f',rooms[num].hvacSetpointTemp[BEDROOM] - 0.5)"
		ELSE
			SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[3]),',0, '"
	}
	ELSE
	{
		SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[1]),',0,OFF'"		
	
		SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[2]),',0, '"
		
		SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[3]),',0, '"
	}
/*
	// Bathroom
	SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[11]),',0,',FORMAT('%2.1f',rooms[num].hvacSetpointTemp[BATHROOM])"
	
	IF(rooms[num].hvacSetpointTemp[BATHROOM] <> 28)
		SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[12]),',0,',FORMAT('%2.1f',rooms[num].hvacSetpointTemp[BATHROOM] + 0.5)"
	ELSE
		SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[12]),',0, '"
	
	IF(rooms[num].hvacSetpointTemp[BATHROOM] <> 16)
		SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[13]),',0,',FORMAT('%2.1f',rooms[num].hvacSetpointTemp[BATHROOM] - 0.5)"
	ELSE
		SEND_COMMAND h_TPTabRooms[num], "'^TXT-',itoa(h_ad_SetPointValues[13]),',0, '"
*/

}

DEFINE_EVENT

	DATA_EVENT[0:1:0]
	{
		ONLINE:
		{
			WAIT 50  TIMELINE_CREATE(TIMELINE_DEFINE_PROGRAM_HVAC_CUSTOM, POLL_TIME, 1, TIMELINE_RELATIVE, TIMELINE_REPEAT)	
		}
	}

	BUTTON_EVENT[h_TPTabRooms,h_ch_SetPointCommands]
	{
		PUSH:
		{
			stack_var char num
			
			num = TPNumberRooms(button.input.device)
			
			switch (GET_LAST(h_ch_SetPointCommands))
			{
				//-----------------------------------------------------------
				// BEDROOM --------------------------------------------------
				//-----------------------------------------------------------
				case 1:
				{
					IF(rooms[num].hvacMode == HVAC_MODE_HEAT)
					{
						IF(rooms[num].hvacSetpointTempHot[BEDROOM] < 27.5)
							rooms[num].hvacSetpointTempHot[BEDROOM] = rooms[num].hvacSetpointTempHot[BEDROOM] + 0.5
						ELSE
							rooms[num].hvacSetpointTempHot[BEDROOM] = 28
						
						rooms[num].hvacSetpointTemp[BEDROOM] = rooms[num].hvacSetpointTempHot[BEDROOM]
						
						sendToCrestronBacnet("'GTC@',itoa(rooms[num].number),'@SETPOINT_HOT@',ftoa(rooms[num].hvacSetpointTempHot[BEDROOM] * 100)")
					}
					ELSE IF(rooms[num].hvacMode == HVAC_MODE_COOL)
					{
						IF(rooms[num].hvacSetpointTempCold[BEDROOM] < 27.5)
							rooms[num].hvacSetpointTempCold[BEDROOM] = rooms[num].hvacSetpointTempCold[BEDROOM] + 0.5
						ELSE
							rooms[num].hvacSetpointTempCold[BEDROOM] = 28
						
						rooms[num].hvacSetpointTemp[BEDROOM] = rooms[num].hvacSetpointTempCold[BEDROOM]

						sendToCrestronBacnet("'GTC@',itoa(rooms[num].number),'@SETPOINT_COL@',ftoa(rooms[num].hvacSetpointTempCold[BEDROOM] * 100)")
					}
					
					IF(rooms[num].windowsOpened)
						SEND_COMMAND h_TPTabRooms[num], '^PPN-Windows Opened'
					
					Refresh_HVAC_Page(num)
				}
				case 2:
				{
					IF(rooms[num].hvacMode == HVAC_MODE_HEAT)
					{
						IF(rooms[num].hvacSetpointTempHot[BEDROOM] > 16.5)
						rooms[num].hvacSetpointTempHot[BEDROOM] = rooms[num].hvacSetpointTempHot[BEDROOM] - 0.5
						ELSE
							rooms[num].hvacSetpointTempHot[BEDROOM] = 16
						
						rooms[num].hvacSetpointTemp[BEDROOM] = rooms[num].hvacSetpointTempHot[BEDROOM]
											
						sendToCrestronBacnet("'GTC@',itoa(rooms[num].number),'@SETPOINT_HOT@',ftoa(rooms[num].hvacSetpointTempHot[BEDROOM] * 100)")
					}
					ELSE IF(rooms[num].hvacMode == HVAC_MODE_COOL)
					{
						IF(rooms[num].hvacSetpointTempCold[BEDROOM] > 16.5)
						rooms[num].hvacSetpointTempCold[BEDROOM] = rooms[num].hvacSetpointTempCold[BEDROOM] - 0.5
						ELSE
							rooms[num].hvacSetpointTempCold[BEDROOM] = 16
						
						rooms[num].hvacSetpointTemp[BEDROOM] = rooms[num].hvacSetpointTempCold[BEDROOM]
						
						sendToCrestronBacnet("'GTC@',itoa(rooms[num].number),'@SETPOINT_COL@',ftoa(rooms[num].hvacSetpointTempCold[BEDROOM] * 100)")
					}
					
					IF(rooms[num].windowsOpened)
						SEND_COMMAND h_TPTabRooms[num], '^PPN-Windows Opened'
					
					
					Refresh_HVAC_Page(num)
				}
			}
		}
		
		HOLD[5,REPEAT]:
		{
			
		}
	}

	TIMELINE_EVENT[TIMELINE_DEFINE_PROGRAM_HVAC_CUSTOM]
	{
		//pollHVAC(5)
	}

/*
CRESTRON ? AMX:
-	GTC@301@MODE@VAL
-	GTC@301@SETPOINT@VAL
-	GTC@301@TEMP@VAL

AMX ? CRESTRON :
-	GTC@301@MODE@?
-	GTC@301@SETPOINT@?
-	GTC@301@TEMP@?
-	GTC@301@SETPOINT_HOT@VAL
-	GTC@301@SETPOINT_COL@VAL

*/
