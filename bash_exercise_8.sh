#!/bin/bash

#this script will go over a txt file and remove all the lines with the word "delete"

#main
sed -i '/delete/d' ./file.txt

