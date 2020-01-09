#!/bin/bash

#this script will add a new line every 4 lines of text in the let_it_be2.txt file

awk -v n=4 '1; NR % n == 0 {print ""}' let_it_be2.txt
