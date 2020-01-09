#!/bin/bash

#This script will move all files created in bash exercise no' 1 to a different folder.

#test if the folder exists
if [[ ! -d /home/danielp/new_folder ]]; then
	mkdir /home/danielp/new_folder
else
	echo "folder already exists"
fi

#main
for i in {1..30}.txt
do
	mv "$i" /home/danielp/new_folder
done
