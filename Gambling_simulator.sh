#!/bin/bash -x

echo "*******************Wellcome to Gambling Simulator******************"

#CONSTANT VARIABLE INITIALIZE
stake=100
BET=1
halfStake=$(($stake/2))
lossLimit=$(($halfStake*$stake/$stake))
gainLimit=$(($stake+$lossLimit))
totalDays=30
initialStake=100
GainOrLoss=0
overallProfit=0
overallLoss=0
win=0
loss=0

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
		else
			stake=$(($stake-$BET))
		fi
	done
	#echo $stake
	if [ $stake -gt $initialStake ]
	then
		stakeToBe=$(($stake-$initialStake))
		overallProfit=$(($overallProfit+$stakeToBe))
		(( win++ ))
	elif [ $stake -lt $initialStake ]
	then
		stakeToBe=$(($stake-$initialStake))
		overallLoss=$(($overallLoss+$stakeToBe))
		(( loss++ ))
	fi
	echo $stakeToBe
	GainOrLoss=$(($GainOrLoss+$stakeToBe))
	stake=100
done

#DISPLAY TOTAL DAYS WON AND LOST
echo "Days won : $win"
echo "Days loss : $loss"

#DISPLAY OVERALL PROFIT AND LOSS OF ONE MONTH
echo "Overall profit of one month : $overallProfit"
echo "Overall loss of one month : $overallLoss"
