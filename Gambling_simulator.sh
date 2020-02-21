#!/bin/bash -x

echo "*******************Wellcome to Gambling Simulator******************"

#CONSTANT VARIABLE INITIALIZE
stake=100
BET=1
halfStake=$(($stake/2))
lossLimit=$(($halfStake*$stake/$stake))
gainLimit=$(($stake+$lossLimit))
totalDays=20
initialStake=100
GainOrLoss=0

#CHECK THE CONDITIONS FOR GAIN OR LOSS
for((day=1; day<=$totalDays; day++))
do	
	while [ $stake -ne $lossLimit ]
	do
		if [ $stake -eq $gainLimit ]
		then
			break
		fi
		if [ $(( RANDOM%2 )) -eq $BET ]
		then
			stake=$(($stake+$BET)) 
			(( win++ ))
		else
			stake=$(($stake-$BET))
			(( loss-- ))
		fi
	done
	echo "Daily stake changed : $stake"
	if [ $stake -gt $initialStake ]
	then
		stakeToBe=$(($stake-$initialStake))
	elif [ $stake -lt $initialStake ]
	then
		stakeToBe=$(($stake-$initialStake))
	fi
	echo "Stake changed by :$stakeToBe"
	echo ""
	GainOrLoss=$(($GainOrLoss+$stakeToBe))
	stake=100
done

#DISPLAY TOTAL GAIN OR LOSS OF 20 DAYS
echo "Overall gain or loss : $GainOrLoss"
