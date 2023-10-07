#!/bin/bash

echo -n "First name? "
read firstname
echo -n "Last name? "
read lastname

# Get the current time
currentTime=$(date +"%H:%M:%S %Z")
currentHour=$(date +"%H")

# Print the current time
# echo "The current time is: $currentTime"

eveningTime=17

# if (( "$currentHour" <= "$eveningTime" ))
if [ $currentHour -le $eveningTime ]
then
	echo "Hi $firstname $lastname!"
else
	echo "Good evening $firstname $lastname :)"
fi
