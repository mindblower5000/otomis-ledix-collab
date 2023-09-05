PROGRAM_NAME='common_master_code'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 11/12/2019  AT: 15:27:29        *)
(***********************************************************)


DEFINE_VARIABLE


//-----------------------------------------------------------------------------
// Alarm clock ----------------------------------------------------------------
//-----------------------------------------------------------------------------
#IF_DEFINED COMPIL_ALARM_CLOCK
	PERSISTENT CHAR alarmTimes[NB_ROOMS][7][5] 	= 	{
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'},
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'},
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'},
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'},
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'},
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'},
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'},
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'},
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'},
														{'08:00', '22:00', '22:00', '00:30', '08:00', '08:00', '08:00'}
													}
	PERSISTENT CHAR alarmEnabled[NB_ROOMS][7] 	= 	{
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE},
														{FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE}
													}
	VOLATILE CHAR alarmExecutionCount[NB_ROOMS][7]
#END_IF

DEFINE_CALL 'refreshOverview'
{}

DEFINE_FUNCTION refreshAlarmClock(CHAR num)
{
	#IF_DEFINED COMPIL_ALARM_CLOCK
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClock[1]), ',0, ', alarmTimes[num][1]"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClock[2]), ',0, ', alarmTimes[num][2]"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClock[3]), ',0, ', alarmTimes[num][3]"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClock[4]), ',0, ', alarmTimes[num][4]"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClock[5]), ',0, ', alarmTimes[num][5]"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClock[6]), ',0, ', alarmTimes[num][6]"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClock[7]), ',0, ', alarmTimes[num][7]"
		
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClockPlus[1]), ',0, ', TimePlus1(alarmTimes[num][1])"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClockPlus[2]), ',0, ', TimePlus1(alarmTimes[num][2])"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClockPlus[3]), ',0, ', TimePlus1(alarmTimes[num][3])"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClockPlus[4]), ',0, ', TimePlus1(alarmTimes[num][4])"

		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClockMoins[1]), ',0, ', TimeMoins1(alarmTimes[num][1])"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClockMoins[2]), ',0, ', TimeMoins1(alarmTimes[num][2])"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClockMoins[3]), ',0, ', TimeMoins1(alarmTimes[num][3])"
		SEND_COMMAND i_TPTabRooms[num],	"'^TXT-', ITOA(i_ad_AlarmClockMoins[4]), ',0, ', TimeMoins1(alarmTimes[num][4])"

	#END_IF
}

DEFINE_FUNCTION CHAR[8] formatTime (LONG longTime)
{
	STACK_VAR LONG h,m,s
	STACK_VAR CHAR ret[8]

	s = longTime % 60
	m = ((longTime - s) / 60) % 60
	h = (longTime - (s + m * 60)) / 3600

	ret = FORMAT('%02d:', h)
	ret = "ret, FORMAT('%02d:', m)"
	ret = "ret, FORMAT('%02d', s)"

	RETURN ret
}

DEFINE_FUNCTION CHAR[5] TimePlus1 (CHAR _Time[])
{
	STACK_VAR CHAR tab[2][3]
	
	StringSplit(_Time, ':', tab)
	
	IF(tab[2] <> '59')
	{
		tab[2] = FORMAT('%02d', ATOI(tab[2]) + 1)
	}
	ELSE
	{
		tab[2] = '00'
		
		IF(tab[1] <> '23')
			tab[1] = FORMAT('%02d', ATOI(tab[1]) + 1)
		ELSE
			tab[1] = '00'
	}
	
	return "tab[1],':',tab[2]"
}

DEFINE_FUNCTION CHAR[5] TimeMoins1 (CHAR _Time[])
{
	STACK_VAR CHAR tab[2][3]
	
	StringSplit(_Time, ':', tab)
	
	IF(tab[2] <> '00')
	{
		tab[2] = FORMAT('%02d', ATOI(tab[2]) - 1)
	}
	ELSE
	{
		tab[2] = '59'
		
		IF(tab[1] <> '00')
			tab[1] = FORMAT('%02d', ATOI(tab[1]) - 1)
		ELSE
			tab[1] = '23'
	}
	
	return "tab[1],':',tab[2]"
}

DEFINE_FUNCTION CHAR TPNumberRooms(DEV dvTP)
{
	LOCAL_VAR CHAR i
	FOR (i=1;i<=EFFECTIVE_TP_NB_ROOMS;i++)
	{
		IF (i_TPTabRooms[i].NUMBER == dvTP.NUMBER)
			RETURN i
	}
	RETURN 0
}

DEFINE_FUNCTION INTEGER TPNumberIntRooms(DEV dvTP)
{
	LOCAL_VAR INTEGER i
	FOR (i=1;i<=EFFECTIVE_TP_NB_ROOMS;i++)
	{
		IF (i_TPTabRooms[i] == dvTP)
			RETURN i
	}
	RETURN 0
}

DEFINE_FUNCTION CHAR TPNumberPC(DEV dvTP)
{
	LOCAL_VAR INTEGER i
	FOR (i=1;i<=EFFECTIVE_TP_NB_PC;i++)
	{
		IF (TPTabPC[i] == dvTP)
			RETURN i
	}
	RETURN 0
}

DEFINE_FUNCTION INTEGER TPNumberIntPC(DEV dvTP)
{
	LOCAL_VAR INTEGER i
	FOR (i=1;i<=EFFECTIVE_TP_NB_PC;i++)
	{
		IF (TPTabPC[i] == dvTP)
			RETURN i
	}
	RETURN 0
}

DEFINE_EVENT

#IF_DEFINED COMPIL_ALARM_CLOCK
BUTTON_EVENT[i_TPTabRooms, i_ch_AlarmClock]
{
	PUSH:
	{
		STACK_VAR INTEGER index, action
		LOCAL_VAR CHAR num
		LOCAL_VAR CHAR str[10]
		LOCAL_VAR CHAR tab[2][3]
			
		num = TPNumberRooms(button.input.device)
			
		action = (GET_LAST(i_ch_AlarmClock) - 1) % 5
		index = ((GET_LAST(i_ch_AlarmClock) - 1) / 5) + 1
		str = alarmTimes[num][index]
	
		StringSplit(str, ':', tab)

		SWITCH (index)
		{
			DEFAULT:
			{
				SWITCH (action)
				{
					CASE 0:	//Hour +
					{
						IF (tab[1] <> '23')
							alarmTimes[num][index] = "FORMAT('%02d', ATOI(tab[1]) + 1), ':', tab[2]"
						ELSE
							alarmTimes[num][index] = "'00:', tab[2]"
					}

					CASE 1:	//Hour -
					{
						IF (tab[1] <> '00')
							alarmTimes[num][index] = "FORMAT('%02d', ATOI(tab[1]) - 1), ':', tab[2]"
						ELSE
							alarmTimes[num][index] = "'23:', tab[2]"
					}

					CASE 2:	//Minute +
					{
						IF (tab[2] <> '59')
							alarmTimes[num][index] = "tab[1], ':', FORMAT('%02d', ATOI(tab[2]) + 1)"
						ELSE
							alarmTimes[num][index] = "tab[1], ':00'"
					}

					CASE 3:	//Minute -
					{
						IF (tab[2] <> '00')
							alarmTimes[num][index] = "tab[1], ':', FORMAT('%02d', ATOI(tab[2]) - 1)"
						ELSE
							alarmTimes[num][index] = "tab[1], ':59'"
					}

					CASE 4:	//Enable/disable
					{
						IF (alarmEnabled[num][index])
							alarmEnabled[num][index] = FALSE
						ELSE
							alarmEnabled[num][index] = TRUE
							
						IF(index == 3)
							alarmEnabled[num][4] = alarmEnabled[num][3]
					}
				}
			}
		}
		WAIT 1 refreshAlarmClock(num)
	}
}
#END_IF
