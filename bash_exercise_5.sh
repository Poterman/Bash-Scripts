#!/bin/bash

#this script will recive a path to a zip file and will extract it to a location of your choosing

###main###
read -p "please enter the full path to your zip file: " zipfile

unzip "$zipfile" -d  /home/danielp/new_folder
