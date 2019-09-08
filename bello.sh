#! /bin/bash

########################
#Created By: Daniel Poterman
#Date 08/09/19
#Purpose: Class Exercise
########################

#Variable Decleration#
WHOAMI=$(whoami)

#Main#
if [[ $WHOAMI == root ]]; then
	echo "you are logged in as user root... exiting"
	sleep 2
	exit 0
fi

echo "Hello $WHOAMI"
sleep 2
