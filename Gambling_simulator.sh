#!/bin/bash -x

echo "*******************Wellcome to Gambling Simulator******************"

#CONSTANT VARIABLE INITIALIZE
stake=100
BET=1
halfStake=$(($stake/2))
lossLimit=$(($halfStake*$stake/$stake))
gainLimit=$(($stake+$lossLimit))

#CHECK THE CONDITIONS FOR GAIN OR LOSS
while [ $stake -ne $lossLimit ]
do
	if [ $stake -eq $gainLimit ]
	then
		break
	fi
	if [ $(( RANDOM%2 )) -eq $BET ]
	then
		stake=$(($stake+$BET)) 
		echo "wins !!!"	
	else
		stake=$(($stake-$BET))
		echo "loss !!!"
	fi
done

#DISPLAY RESULTANT STACK
echo "gambler's resultant stake is $stake rs."
