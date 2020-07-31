#!/bin/bash -x

#constants
STAKE=100
BETAMOUNT=1

#variables
noOfWinDay=0
noOfLossDay=0
#arrays
declare -A win
declare -A loss
count=1
stakeForTheDay=$STAKE;
percentStake=$(((STAKE*50)/100))

function play(){
	STAKE=100
	noOfWins=0
	noofLoss=0
	stakeForTheDay=$STAKE
	percentStake=$(((STAKE*50)/100))
	while [ $STAKE -gt $((stakeForTheDay-percentStake)) ] && [ $STAKE -lt $((stakeForTheDay+percentStake)) ]
	do
		result=$((RANDOM%2))

		if [ $result -eq 1 ]
		then
			STAKE=$((STAKE + BETAMOUNT))
			((noOfWins++))
		else
			STAKE=$((STAKE - BETAMOUNT))
			((noOfLoss++))
		fi
	done
	if [ $STAKE -gt $stakeForTheDay ]
	then
		win[$count]=$noOfWins
		loss[$count]=$noOfLoss
		((count++))
		((noOfWinDay++))
	else
		win[$count]=$noOfWins
		loss[$count]=$moOfLoss
		((count++))
		((noOfLossDay++))
	fi
	echo "you have done for the days bet"
}

function getAmount(){
	if [ $noOfWinDay -gt $noOfLossDay ]
	then
		result=$((noOfWinDay*percentStake))
		echo "the individual won $noOfWinDay days an amount of $result"
	else
		result=$((noOfLossDay*percentStake))
		echo "the individual lost $noOfLossDay days an amount of $result"
	fi
}

function getLuckyDay(){

lucky=${win[1]}
for i in ${win[@]}
do
     if [[ $i -gt $lucky ]]
     then
        lucky="$i"
     fi
done
for i in ${win[@]}
do
        ((countj++))
        if [[ $i -eq $lucky ]]
        then

                echo "the day lucky day was $countj with win of about $lucky times"
        fi
done
lucky=${loss[1]}
for i in ${loss[@]}
do
     if [[ $i -gt $lucky ]]
     then
        lucky="$i"
     fi
done
for i in ${loss[@]}
do
	((countk++))
	if [[ $i -eq $lucky ]]
	then

		echo "the unlucky day was $countk with loss for about $lucky times"
	fi
done
}
function getNextMonthCheck(){
	if [ $noOfWinDay -gt $noOfLossDay ]
	then
		echo "you are eligible for next month also so enter 0 to continue or 1 to stop"
		read input
		if [ $input -eq 0 ]
		then
			for (( i=0;i<30;i++ ))
			do
				play
			done
			getAmount
			getLuckyDay
			getNextMonthCheck
		else
			echo "thanks for playing"
		fi
	else
		echo "you have loss more money plz stop playing for next month"
	fi
}
for (( i=0;i<30;i++ ))
do
play
done
getAmount
getLuckyDay
getNextMonthCheck
