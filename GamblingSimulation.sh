#! /bin/bash -x

stake=100
gameamount=0

Won=0
Lost=0

while [[ $stake != 0 && $gameamount -lt $stake ]]
do
	((gameamount++))
	result=$(($RANDOM%2))
	if [[ $result == 0 ]]
	then
	((Lost++))
	else [[ $result == 1 ]]
	((Won++))
	fi
done


echo Won $Won times
echo Lost $Lost times

