#!/bin/bash -x

stake=100
betamount=1
amountwonaday=0
amountlostaday=0

maxAmountOfDay=$(( $stake + ($stake*50)/100 | bc ));
minAmountOfDay=$(($stake - ($stake * 50)/100 | bc ));

for((days=1;days<=30;days++))
do
	stakeForTheDay=$stake

	while [[ $stakeForTheDay != $maxAmountOfDay && $stakeForTheDay != $minAmountOfDay ]]
	do
	result=$(($RANDOM % 2))
	if [[ $result == 1 ]]
	then
		stakeForTheDay=$((stakeForTheDay+betamount))
		((amountwonaday++))
	else
		stakeForTheDay=$((stakeForTheDay-betamount))
		((amountlostaday++))

	fi
	done

	if [[ $days -gt 20 && $days -le 30 ]]
	then
	echo amount won on day $days $amountwonaday
	echo amount lost on day $days $amountlostaday
	fi

done


echo $days

