#! /bin/bash -x

stake=100
betamount=1

#Calculating the result if won or lost using RANDOM function
result=$(($RANDOM%2))
if [[ $result == 1 ]]
then
	stake=$((stake+betamount))
	echo "Won the game"
else
	stake=$((stake-betamount))
	echo "Lost the game"
fi

#condition on which resignation for the day will happen
if [[ $stake == 150 || $stake == 50 ]]
then
	echo "Resign for the day"
fi

