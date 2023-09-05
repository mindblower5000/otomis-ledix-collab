PROGRAM_NAME='_utils2'

#IF_NOT_DEFINED __utils2
#DEFINE __utils2

/*
  String handling include
  -------------------------------
  Author :  AM
  Version : 1.0
  Date :    2016-12-01
*/


DEFINE_FUNCTION StringSplitStack (CHAR toSplit[1000], CHAR separateur[], CHAR retour[][])
{
  STACK_VAR CHAR toSplit2[1000]
  STACK_VAR CHAR gauche[200]
  STACK_VAR cpt
  
  toSplit2 = toSplit
  
  cpt = 1
  WHILE (FIND_STRING(toSplit2, separateur, 1) <> 0)
  {
  
    gauche = REMOVE_STRING(toSplit2, separateur, 1)
    retour[cpt] = LEFT_STRING(gauche, LENGTH_STRING(gauche) - LENGTH_STRING(separateur))
    //SEND_STRING 0, "'StringSplit:',toSplit2"
    //SEND_STRING 0, "'StringSplitStack:',retour[cpt] "
    cpt++
  }
  retour[cpt] = toSplit2
}



DEFINE_FUNCTION StringSplitMassive (CHAR toSplit[], CHAR separateur[], CHAR retour[][])
/*Splits a string according to a separator

Example: 
CHAR tab[3][20]
StringSplit('Part1:Part2:Part3', ':', tab)
SEND_STRING 0, tab[1] //Echoes "Part1"
SEND_STRING 0, tab[2] //Echoes "Part2"
SEND_STRING 0, tab[3] //Echoes "Part3"

*/
{
  STACK_VAR CHAR toSplit2[10000]
  STACK_VAR CHAR gauche[10000]
  STACK_VAR cpt
  
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



//By AM
DEFINE_FUNCTION STRING_TO_DEV(CHAR str[], DEV _DEVICE)
{
    STACK_VAR CHAR tab[4][45]    
    
    StringSplitStack(str, ':', tab)

    _DEVICE.Number  = ATOI(tab[1])
    _DEVICE.Port    = ATOI(tab[2])
    _DEVICE.System  = ATOI(tab[3])    
}


DEFINE_FUNCTION STRING_TO_DEV_SP(CHAR str[], CHAR separator[], DEV _DEVICE)
{
    STACK_VAR CHAR tab[4][45]    
    
    StringSplitStack(str, separator, tab)

    _DEVICE.Number  = ATOI(tab[1])
    _DEVICE.Port    = ATOI(tab[2])
    _DEVICE.System  = ATOI(tab[3])    
}



DEFINE_FUNCTION CHAR[30] DEV_TO_STRING(DEV _DEVICE)
{
    RETURN "ITOA(_DEVICE.Number),':', ITOA(_DEVICE.Port),':',ITOA(_DEVICE.System)"
}


DEFINE_FUNCTION CHAR[30] DEV_TO_STRING_SP(DEV _DEVICE, CHAR separator[])
{
    RETURN "ITOA(_DEVICE.Number),separator, ITOA(_DEVICE.Port),separator,ITOA(_DEVICE.System)"
}



DEFINE_FUNCTION FLOAT fabs (FLOAT value){
IF(value<0)
 {RETURN value*-1;}
 
 RETURN value;
}


#END_IF
