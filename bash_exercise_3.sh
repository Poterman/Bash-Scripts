#!/bin/bash 

#this script will recive a path to file as parameter and will run the "grep" command on it,
#looking at the content of a file and print all lines without the word "test" in them

#Getting the path
read -p "please enter a full path to the requested file: " path

###main###
grep -v test $path
