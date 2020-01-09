#!/bin/bash

#this script will sum the total value of the files and folders in "output".txt file
echo "The sum of all the files and folders is: "$(awk -F ' ' '{sum+=$5;}END{print sum;}' output.txt)""
