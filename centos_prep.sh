#!/usr/bin/env bash

################################################
#Created By: Poterman
#Date: 23/09/19
#Purpose: Automatic CentOS First Configuration
################################################

#Connecting to internet
sudo dhclient

#Updating OS
sudo yum -y update

#Installing Epel-Release Repository
sudo yum -y install epel-release

#Installing Tools
sudo yum -y install vim git 

#Installing GUI - Optional
printf "%s\n" "Do you wish to install GNOME Desktop?"
printf "%s\n" "Type [Y]es / [N]o"
read answer
if [[ $answer == "Y" || $answer == "y" ]]; then
  echo "Installing GNOME Desktop"
  sudo yum groupinstall -y "GNOME Desktop"
  systemctl set-default graphical.target
elif [[ $answer == "N" || $answer == "n" ]]; then
  echo "You chose NOT to install GNOME Desktop"
fi
