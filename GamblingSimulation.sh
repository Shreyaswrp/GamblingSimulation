#!/bin/bash -x

stake=100
betamount=1

amountwonaday=0
amountlostaday=0

maxAmountOfDay=$(( $stake + ($stake*50)/100 | bc ));
minAmountOfDay=$(($stake - ($stake * 50)/100 | bc ));

stakeForTheDay=$stake


function play () {



        while [ $stakeForTheDay != $maxAmountOfDay ] && [ $stakeForTheDay != $minAmountOfDay ]
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
	echo $amountwonaday
	echo $amountlostaday

}
for((days=1;days<=30;days++))
do

	play
	if [ $days -gt 20  ]
	then
	echo amount won on day $days $amountwonaday
	echo amount lost on day $days $amountlostaday
	fi

done





