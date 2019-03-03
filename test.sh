#!/bin/bash
#set -x
#####################################
#creator: Daniel Poterman
#date: 27/02/19
#version: 0.0.1
#####################################

#this scripts will show your network interface, mac address and ip address in a chart.
if [ -f /sbin/ifconfig ] ;
    then echo "ifconfig exists" ;
fi


#for iface in $(ifconfig | cut -d ' ' -f1| tr '\n' ' ')
#do 
 # addr=$(ip -o -4 addr list $iface | awk '{print $4}' | cut -d/ -f1)
 # printf "$iface\t$addr\n"
#done

line="================================================================="

table_print(){

	

	format=" %-16s %-10s %10s \n"
	
	printf "%s\n" "$line"
		printf "$format"  "INTERFACE" "IP" "MAC"
	printf "%s\n" "$line"
		
	
	for i in $(ifconfig -a|grep flags|grep -v lo |awk '{print $1}'|sed 's/\:/ /')
			do
				printf "%s\t\t" $i
				
				printf "%s\t%s\t" $(ifconfig $i|grep 'inet'|grep -v inet6|awk '{print $2}')
				
				printf "%s\t%s\t" $(ifconfig $i| grep -v 127|grep -v  inet6| egrep 'ether'|awk '{print $2}')
				
			echo 
				
		done
	printf "%s\n" "$line"
}
table_print
