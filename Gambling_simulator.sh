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
stake2=100

#CALCULATE THE SUM OF DAILY LOSS OR GAIN 
declare -A dict
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
	if [ $stake -gt $initialStake ]
	then
		profit_loss=$(($stake-$initialStake))
	elif [ $stake -lt $initialStake ]
	then
		profit_loss=$(($stake-$initialStake))
	fi
	stake2=$(($stake2+$profit_loss))	 
	echo "$profit_loss : $stake2"
	dict[$day]=$stake2
	stake=100
done

#DISPLAY VALUES AND INDEXES IN THE DICTIONARY
echo "values : ${dict[@]}"
echo "keys   : ${!dict[@]}"

#DISPLAY SORTED DICTIONARY IN DESCENDING ORDER 
echo "luckiest :" 
for k in ${!dict[@]}
do
	echo $k '-' ${dict[$k]}
done|sort -rn -k3|head -1

#DISPLAY SORTED DICTIONARY IN ASCENDING ORDER
echo "unluckiest :"
for k in ${!dict[@]}
do
	echo $k '-' ${dict[$k]}
done|sort -rn -k3|tail -1
