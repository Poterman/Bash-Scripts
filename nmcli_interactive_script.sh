#!/bin/bash

###########################################################################################
#Creator: Poterman
#Purpose: Interactive script that helps the user to set interfaces with nmcli.
#Version: 1.3.11
###########################################################################################

#======================================To Do List=========================================#
#1. interface and profile (connection)
#2. configure ip netmask gateway broadcast dns profile name.
#3. getopts*

printf "%s\n" "Hello And Welcome To My First Interactive Script!"
printf "%s\n" " "
printf "%s\n" "In This Script We Will Configure Your Network Interface Step by Step"
printf "%s\n" " "
printf "%s\n" "Ready? Let's Do This"
printf "%s\n" "=========================================================================="

#Deciding how to call the network
printf "%s\n" "Please Choose A Name For Your Network"
read name
printf "%s\n" "You Have Decided To Call It $name"
printf "%s\n" " "

#Getting the Device's name:
printf "%s\n" "Here's a List Of Available Interfaces:"
printf "%s\n" $(nmcli device | awk '{ print $1}' | grep -v DEVICE)
printf "%s\n" "Please Select An Interface"
read interface
printf "%s\n" "You Have Selected $interface"
printf "%s\n" " "

#Choosing the network type
printf "%s\n" "Please Choose The Type Of Your Network:"
printf "%s\n" "Your Options Are:"
printf "%s\n" "ethernet, wifi, vlan or bluetooth"
read Type
printf "%s\n" "You Chose $Type"
printf "%s\n" " "

#Choosing an ip address:
printf "%s\n" "Please Choose an IP Address."
printf "%s\n" "Here's An Example Of How It Should Be Written: 192.168.1.10/24"
read Ip
printf "%s\n" "You Have Selected The Following IP Address $Ip"
printf "%s\n" " "

#setting up the connection
nmcli con add con-name $name ifname $interface type $Type ip4 $Ip 

sleep 5s

#Activating The Newly Born Connection:
nmcli con up $name
sleep 5s
printf "%s\n" "Your New Conncetion Is Up"

#Adding a Gatway:
printf "%s\n" "Now Lets Add a Gateway"
printf "%s\n" "Please Choose A Gateway Address, For Example 192.168.1.1"
read gateway
printf "%s\n" "You Chose $gateway"
nmcli con mod "$name" ipv4.gateway $gateway

#Adding a DNS Address:
printf "%s\n" "Lastly, Let's Configure The DNS Address"
printf "%s\n" "Please Choose A DNS Address, For Example 192.168.1.2 or 8.8.8.8"
read sDns
printf "%s\n" "You Chose $Dns"
nmcli con mod "$name" ipv4.dns $Dns

printf "%s\n" "That's It! You Have Succecfuly Configured Your Network!"
printf "%s\n" "Hope You Enjoyed, See You Next Time"
sleep 10s 
exit

###########################################################################################
#command that prints interfaces
#nmcli device |awk '{print $1}' |grep -v DEVICE

#command for creating a connection should looks ike this:
#nmcli con add con-name rnadom_name ifname enp0s3 type ethernet ip4 192.168.1.30/24

#command for activating the connection:
#nmcli con up random_name

#command for adding a gateway:
#nmcli con mod "random_name" ipv4.gateway 192.168.1.1

#command for adding a DNS records:
#nmcli con mod "random_name" ipv4.dns 192.168.1.1
#addind a second DNS:
#nmcli con mod "random_name" +ipv4.dns 8.8.8.8



