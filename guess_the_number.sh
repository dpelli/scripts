#!/bin/bash

# generate random number
range=20
min=1
random=$((RANDOM % $range + $min))

# get user's guess
echo -n "Guess a number... "
read guess

# start countdown
N=3
for (( i=$N; i>=1; i-- )) ; do
	sleep 1
	echo $i...
done

# evaluate guess and respond
range_array=( $(seq $min $range ) )

if [[ ! "${range_array[*]}" =~ " $guess " ]]
then
	echo -n "Invalid number. Guess again... "
	read guess
fi

if [[ $guess == $random ]]
then
	echo "Correct!"
else
	diff = 0
	if [ $guess -le $random ]
	then
		diff=$($random-$guess)
		echo "Too low :("
	else
		diff=$($guess-$random)
		echo "Too high :("
	fi
	echo "The number was $random. You were $diff numbers off. ¯\_(ツ)_/¯"
fi

