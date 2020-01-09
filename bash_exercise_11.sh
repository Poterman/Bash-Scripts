#!/bin/bash

#this script will only show the folder and file names inside "output.txt" file

awk '{print $9}' output.txt
