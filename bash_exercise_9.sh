#!/bin/bash

#this script will go over a txt file and delete all "empty" lines

#main
sed -i '/^[[:space:]]*$/d' let_it_be.txt

