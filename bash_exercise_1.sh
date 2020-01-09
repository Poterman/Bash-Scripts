#!/bin/bash

#Script which creates 30 txt files and insert a number in each file.
#date: 07/01/2020

###main###

#inserting data in the files
for i in {1..30}
do
	touch {1..30}.txt
	echo "$i" > "$i.txt"
done
