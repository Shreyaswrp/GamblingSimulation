stake=100
betamount=1

totalamountwon=0
totalamountlost=0

maxAmountOfDay=$(( $stake + ($stake*50)/100 | bc ));
minAmountOfDay=$(($stake - ($stake * 50)/100 | bc ));

function play () {

        result=$((RANDOM % 2))
        if [ $result == 1 ]
        then
                stakeForTheDay=$((stakeForTheDay+betamount))
                ((amountwonaday++))
        else
                stakeForTheDay=$((stakeForTheDay-betamount))
                ((amountlostaday++))

        fi
}

for((days=1;days<=30;days++))
do
	stakeForTheDay=$stake
	amountwonaday=0
	amountlostaday=0
	numberOfGames=0

	while [ $stakeForTheDay != $maxAmountOfDay ] && [ $stakeForTheDay != $minAmountOfDay ]
	do
		((numberOfGames++))
		play
	done

	if [[ $amountwonaday -gt $amountlostaday ]]
	then
		totalamountwon=$((totalamountwon+(amountwonaday-amountlostaday)))
		echo amount won on day $days $totalamountwon
	else
		totalamountlost=$((totalamountlost+(amountlostaday-amountwonaday)))
		echo amount lost on day $days $totalamountlost
	fi
done





