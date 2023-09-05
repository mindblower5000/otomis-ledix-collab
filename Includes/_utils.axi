PROGRAM_NAME='_utils'

#IF_NOT_DEFINED __utils
#DEFINE __utils

/*
	String handling include
	-------------------------------
	Author : 	CP
	Version : 	2.0
	Date : 		2014-04-24
*/


DEFINE_FUNCTION StringSplit (CHAR toSplit[1000], CHAR separateur[], CHAR retour[][])
/*Splits a string according to a separator

Example: 
CHAR tab[3][20]
StringSplit('Part1:Part2:Part3', ':', tab)
SEND_STRING 0, tab[1] //Echoes "Part1"
SEND_STRING 0, tab[2] //Echoes "Part2"
SEND_STRING 0, tab[3] //Echoes "Part3"

*/
{
	LOCAL_VAR CHAR toSplit2[1000]
	LOCAL_VAR CHAR gauche[200]
	LOCAL_VAR cpt
	
	toSplit2 = toSplit
	
	cpt = 1
	WHILE (FIND_STRING(toSplit2, separateur, 1) <> 0)
	{
		gauche = REMOVE_STRING(toSplit2, separateur, 1)
		retour[cpt] = LEFT_STRING(gauche, LENGTH_STRING(gauche) - LENGTH_STRING(separateur))
		cpt++
	}
	retour[cpt] = toSplit2
}

DEFINE_FUNCTION CHAR[20] computeTimestamp ()
{
	RETURN "'[', FORMAT('%02d', DATE_TO_DAY(LDATE)),'-',
			FORMAT('%02d', DATE_TO_MONTH(LDATE)),'-',
			FORMAT('%02d', DATE_TO_YEAR(LDATE) % 100),'].',
			FORMAT('%02d', TIME_TO_HOUR(TIME)),':',
			FORMAT('%02d', TIME_TO_MINUTE(TIME)),':',
			FORMAT('%02d', TIME_TO_SECOND(TIME))
			"
}

#END_IF
