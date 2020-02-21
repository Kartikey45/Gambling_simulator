#!/bin/bash -x

echo "*******************Wellcome to Gambling Simulator******************"

#CONSTANT VARIABLE INITIALIZE
stake=100
BET=1

#RANDOM VARIABLE INITIALIZE
random=$(( RANDOM%2 ))

#CHECK THE CONDITION 
if [ $random -eq 1 ]
then
	stake=$(($stake+$BET)) 
	echo "wins !!!"	
else
	stake=$(($stake-$BET))
	echo "loss !!!"
fi

#DISPLAY RESULTANT STACK
echo "$stake rs."
