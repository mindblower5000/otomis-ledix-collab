program_name='BYOD'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 01/27/2022  AT: 17:04:12        *)
(***********************************************************)


define_variable

//-----------------------------------------------------------------------------
// BYOD -----------------------------------------------------------------------
//-----------------------------------------------------------------------------
dev BYOD_TPs_Master[] 	= {dvTP_I_iPhone_M_1, dvTP_I_iPhone_M_2, dvTP_I_iPhone_M_3}
persistent char BYOD_devID_Master[5][20]	= {'N/A', 'N/A', 'N/A', 'N/A', 'N/A'}

dev BYOD_TPs_Guest[] 	= {dvTP_I_iPhone_G_1, dvTP_I_iPhone_G_2, dvTP_I_iPhone_G_3}
persistent char BYOD_devID_Guest[5][20]		= {'N/A', 'N/A', 'N/A', 'N/A', 'N/A'}

dev BYOD_TPs_Maid[] 	= {dvTP_I_iPhone_Maid_1, dvTP_I_iPhone_Maid_2, dvTP_I_iPhone_Maid_3}
persistent char BYOD_devID_Maid[5][20]	= {'N/A', 'N/A', 'N/A', 'N/A', 'N/A'}

/*DEV BYOD_TPs_Guest_5[] 	= {dvTP_I_iPhone_Guest_5_1, dvTP_I_iPhone_Guest_5_2}
PERSISTENT CHAR BYOD_devID_Guest_5[2][20]	= {'N/A', 'N/A'}*/

/*DEV BYOD_TPs_All[] 		= {dvTP_I_iPhone_All_1, dvTP_I_iPhone_All_2, dvTP_I_iPhone_All_3}
PERSISTENT CHAR BYOD_devID_All[3][20]		= {'N/A', 'N/A', 'N/A'}*/

/*DEV BYOD_TPs_Common[] 	= {dvTP_I_iPhone_Common_1, dvTP_I_iPhone_Common_2, dvTP_I_iPhone_Common_3}
PERSISTENT CHAR BYOD_devID_Common[3][20]	= {'N/A', 'N/A', 'N/A'}*/



define_call 'setBYODTPDeviceID' (dev dvTPBYOD, integer devID)
{
	send_command dvTPBYOD,"'TPCCMD-0;DeviceID,',itoa(devID),';KeepWifiActive,true;AutoLock,true;ButtonHit,false;ButtonMiss,false;ApplyProfile;'"
}

define_event

data_event[dvTP_BYOD_Free_Master]
{
	online:
	{
		send_command data.device, 'TPCCMD-QueryDeviceInfo'
	}

	string:
	{
		stack_var integer i
		stack_var integer freeDevIndex
		stack_var char alreadyAssigned
		stack_var char devID[20]

		if (left_string(data.text, 6) == 'Device')
		{
			if (remove_string(data.text, 'TPCDeviceID,', 1) <> '')
			{
				//When we receive the answer, we parse the DEVID
				devID = left_string(data.text, 17)

				//Then we check if the device already exists in the list
				alreadyAssigned = FALSE
				for (i = 1; i <= max_length_array(BYOD_TPs_Master); i++)
				{
					if (BYOD_devID_Master[i] == devID)	//If the device already exists we assign the existing device number
					{
						call 'setBYODTPDeviceID' (data.device, BYOD_TPs_Master[i].number)
						alreadyAssigned = TRUE
						break
					}
				}

				//Then we check if there's free devices left
				if (! alreadyAssigned)
				{
					freeDevIndex = 0
					for (i = 1; i <= max_length_array(BYOD_TPs_Master); i++)
					{
						if (BYOD_devID_Master[i] == 'N/A')	//If the device is not used yet, then we will assign it to the new TP
						{
							freeDevIndex = i
							break
						}
					}

					if (freeDevIndex) //A device is free, so we assign its DEVID
					{
						call 'setBYODTPDeviceID' (data.device, BYOD_TPs_Master[freeDevIndex].number)
						BYOD_devID_Master[freeDevIndex] = devID
					}
					else //No more BYOD devices free
					{
						do_push(i_TPTab[1], i_ch_BYOD[1])
						send_command data.device, 'TPCCMD-QueryDeviceInfo'
					}
				}
			}
		}
	}
}

data_event[BYOD_TPs_Master]
{
	online:
	{
		send_command data.device, 'TPCCMD-QueryDeviceInfo'
	}

	string:
	{
		stack_var integer i
		stack_var integer freeDevIndex
		stack_var char devID[20]

		if (left_string(data.text, 10) == 'DeviceInfo')
		{
			if (remove_string(data.text, 'TPCDeviceID,', 1) <> '')
			{
				//When we receive the answer, we parse the DEVID
				devID = left_string(data.text, 17)

				for (i = 1; i <= max_length_array(BYOD_TPs_Master); i++)
				{
					if (data.device == BYOD_TPs_Master[i])
					{
						//Two devices at same number
						if (BYOD_devID_Master[i] <> devID)
						{
							call 'setBYODTPDeviceID' (data.device, dvTP_BYOD_Free_Master.number)
						}
						break
					}
				}
			}
		}
	}
}

data_event[dvTP_BYOD_Free_Guest]
{
	online:
	{
		send_command data.device, 'TPCCMD-QueryDeviceInfo'
	}

	string:
	{
		stack_var integer i
		stack_var integer freeDevIndex
		stack_var char alreadyAssigned
		stack_var char devID[20]

		if (left_string(data.text, 6) == 'Device')
		{
			if (remove_string(data.text, 'TPCDeviceID,', 1) <> '')
			{
				//When we receive the answer, we parse the DEVID
				devID = left_string(data.text, 17)

				//Then we check if the device already exists in the list
				alreadyAssigned = FALSE
				for (i = 1; i <= max_length_array(BYOD_TPs_Guest); i++)
				{
					if (BYOD_devID_Guest[i] == devID)	//If the device already exists we assign the existing device number
					{
						call 'setBYODTPDeviceID' (data.device, BYOD_TPs_Guest[i].number)
						alreadyAssigned = TRUE
						break
					}
				}

				//Then we check if there's free devices left
				if (! alreadyAssigned)
				{
					freeDevIndex = 0
					for (i = 1; i <= max_length_array(BYOD_TPs_Guest); i++)
					{
						if (BYOD_devID_Guest[i] == 'N/A')	//If the device is not used yet, then we will assign it to the new TP
						{
							freeDevIndex = i
							break
						}
					}

					if (freeDevIndex) //A device is free, so we assign its DEVID
					{
						call 'setBYODTPDeviceID' (data.device, BYOD_TPs_Guest[freeDevIndex].number)
						BYOD_devID_Guest[freeDevIndex] = devID
					}
					else //No more BYOD devices free
					{
						do_push(i_TPTab[1], i_ch_BYOD[2])
						send_command data.device, 'TPCCMD-QueryDeviceInfo'
					}
				}
			}
		}
	}
}

data_event[BYOD_TPs_Guest]
{
	online:
	{
		send_command data.device, 'TPCCMD-QueryDeviceInfo'
	}

	string:
	{
		stack_var integer i
		stack_var integer freeDevIndex
		stack_var char devID[20]

		if (left_string(data.text, 10) == 'DeviceInfo')
		{
			if (remove_string(data.text, 'TPCDeviceID,', 1) <> '')
			{
				//When we receive the answer, we parse the DEVID
				devID = left_string(data.text, 17)

				for (i = 1; i <= max_length_array(BYOD_TPs_Guest); i++)
				{
					if (data.device == BYOD_TPs_Guest[i])
					{
						//Two devices at same number
						if (BYOD_devID_Guest[i] <> devID)
						{
							call 'setBYODTPDeviceID' (data.device, dvTP_BYOD_Free_Guest.number)
						}
						break
					}
				}
			}
		}
	}
}

data_event[dvTP_BYOD_Free_Maid]
{
	online:
	{
		send_command data.device, 'TPCCMD-QueryDeviceInfo'
	}

	string:
	{
		stack_var integer i
		stack_var integer freeDevIndex
		stack_var char alreadyAssigned
		stack_var char devID[20]

		if (left_string(data.text, 6) == 'Device')
		{
			if (remove_string(data.text, 'TPCDeviceID,', 1) <> '')
			{
				//When we receive the answer, we parse the DEVID
				devID = left_string(data.text, 17)

				//Then we check if the device already exists in the list
				alreadyAssigned = FALSE
				for (i = 1; i <= max_length_array(BYOD_TPs_Maid); i++)
				{
					if (BYOD_devID_Maid[i] == devID)	//If the device already exists we assign the existing device number
					{
						call 'setBYODTPDeviceID' (data.device, BYOD_TPs_Maid[i].number)
						alreadyAssigned = TRUE
						break
					}
				}

				//Then we check if there's free devices left
				if (! alreadyAssigned)
				{
					freeDevIndex = 0
					for (i = 1; i <= max_length_array(BYOD_TPs_Maid); i++)
					{
						if (BYOD_devID_Maid[i] == 'N/A')	//If the device is not used yet, then we will assign it to the new TP
						{
							freeDevIndex = i
							break
						}
					}

					if (freeDevIndex) //A device is free, so we assign its DEVID
					{
						call 'setBYODTPDeviceID' (data.device, BYOD_TPs_Maid[freeDevIndex].number)
						BYOD_devID_Maid[freeDevIndex] = devID
					}
					else //No more BYOD devices free
					{
						do_push(i_TPTab[1], i_ch_BYOD[2])
						send_command data.device, 'TPCCMD-QueryDeviceInfo'
					}
				}
			}
		}
	}
}

data_event[BYOD_TPs_Maid]
{
	online:
	{
		send_command data.device, 'TPCCMD-QueryDeviceInfo'
	}

	string:
	{
		stack_var integer i
		stack_var integer freeDevIndex
		stack_var char devID[20]

		if (left_string(data.text, 10) == 'DeviceInfo')
		{
			if (remove_string(data.text, 'TPCDeviceID,', 1) <> '')
			{
				//When we receive the answer, we parse the DEVID
				devID = left_string(data.text, 17)

				for (i = 1; i <= max_length_array(BYOD_TPs_Maid); i++)
				{
					if (data.device == BYOD_TPs_Maid[i])
					{
						//Two devices at same number
						if (BYOD_devID_Maid[i] <> devID)
						{
							call 'setBYODTPDeviceID' (data.device, dvTP_BYOD_Free_Maid.number)
						}
						break
					}
				}
			}
		}
	}
}

button_event[i_TPTab, i_ch_BYOD]
{
	push:
	{
		stack_var integer i

		switch(get_last(i_ch_BYOD))
		{
			case 1: //Delete all the Master BYODs
			{
				for (i = 1; i <= max_length_array(BYOD_TPs_Master); i++)
				{
					BYOD_devID_Master[i] = 'N/A'
				}
			}

			case 2: //Delete all the Guest BYODs
			{
				for (i = 1; i <= max_length_array(BYOD_TPs_Guest); i++)
				{
					BYOD_devID_Guest[i] = 'N/A'
				}
			}
			
			case 3: //Delete all the Guest BYODs
			{
				for (i = 1; i <= max_length_array(BYOD_TPs_Maid); i++)
				{
					BYOD_devID_Maid[i] = 'N/A'
				}
			}
		}
	}
}

