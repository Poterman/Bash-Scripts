#!/usr/bin/env bash
set -x
#Creator: Daniel Poterman
#Purpose: Installing MariaDB on Debian Linux
#Date: May 14th 2019
#Version 2.1.4

#Verify if the os is Debian
if [[ $(cat /etc/os-release |grep Debian) ]]; then
  echo "This is Debian OS"
else
  echo "This is not a Debian OS, the script will not work"
  echo "exiting"
  exit 0
fi

#Determine if Mariadb is already installed on Debian
if [[ $(dpkg --get-selections |grep mariadb-server) ]]; then
  echo "MariaDB is already installed. exiting script..."
  exit 0
else
  echo "MariaDB is not installed, continuing installation"
fi

#Installing Package on Debian
sudo apt update
sudo apt install -y MariaDB-server

#Enabling MariaDB Service
systemctl enable mariadb

#Starting MariaDB Service
systemctl start mariadb

#Initial Settings for MariaDB
mysql_secure_installation
