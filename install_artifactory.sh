#!/bin/bash
####################################
#Author: Daniel Poterman
#created date: January 8th 2020
#Purpose:This script will do the following:
#1. download Artifactory zip file
#2. unzip it
#3. install Artifactory jvm parameters
#4. configure environment variables
####################################

######## Variable Decleration ########
line="####################################"
javaver=$(java -version)
test=$(cat /etc/os-release |grep PRETTY_NAME | sed 's/PRETTY_NAME=//g' |awk '{print $1}' |tr -d '="')
ubuntu_codename=$(lsb_release -c |awk '{print $2}')
art_installed=$(sudo systemctl status artifactory.service)

######## Prerequisites ########
#Installing Java adn Setting JAVA_HOME environment variable
echo $line
echo "Checking if java is installed or not"
echo $line
sleep 3
if [[ $javaver == 0 ]]; then
  if [[ $test == "CentOS" ]]; then
    sudo yum update -y
    sudo yum install java-11-openjdk-devel -y
    echo "JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.5.10-0.el7_7.x86_64/bin/java" >> .bash_profile
  elif [[ $test == "Ubuntu" || $test == "Debian" ]]; then
    sudo apt-get update -y
    sudo apt-get install openjdk-8-jdk -y
    echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java" >> /etc/environment
  else
    echo "Error occured.. exiting"
    exit 1
  fi
else
    echo "java is already installed. Continuing"
fi

#Installing necessary tools
echo $line
echo "Installing WGET and unzip"
echo $line
sleep 3
if [[ $test == "CentOS" ]]; then
	sudo yum install wget unzip -y
elif [[ $test == "Ubuntu" ]] || [[ $test == "Debian" ]]; then
	sudo apt-get install wget unzip -y
else
  echo "unknown os.. please install wget and unzip manually and then come back to this script"
fi

######## Main ########
#Determine which distro is being used and running commands accordingly
if [[ $test == "CentOS" ]]; then
	echo "You are using a "$test" machine"
  wget https://bintray.com/jfrog/artifactory-pro-rpms/rpm -O bintray-jfrog-artifactory-pro-rpms.repo
  sudo mv bintray-jfrog-artifactory-pro-rpms.repo /etc/yum.repos.d/
  sudo yum update -y
  if [[ $art_installed == 0 ]]; then
    sudo yum install jfrog-artifactory-pro -y
  else
    echo "Artifactory is already installed"
  fi
  sudo systemctl start artifactory.service
elif [[ $test == "Ubuntu" ]] || [[ $test == "Debian" ]]; then
	echo "You are using a "$test" machine"
  echo "deb https://jfrog.bintray.com/artifactory-pro-debs $ubuntu_codename main" | sudo tee -a /etc/apt/sources.list
  curl https://bintray.com/user/downloadSubjectPublicKey?username=jfrog | sudo apt-key add -
  sudo apt-get update -y
  sudo apt-get install jfrog-artifactory-pro -y
  sudo systemctl start artifactory.service
else
	echo "unknown machine.. downloading Artifactory zip file"
	wget https://jfrog.bintray.com/artifactory-pro/org/artifactory/pro/jfrog-artifactory-pro/6.16.0/jfrog-artifactory-pro-6.16.0.zip
  unzip jfrog-artifactory-pro-*.zip
  cd artifactory-pro*/bin && sudo ./artifactory.sh
fi

echo $line
echo "Thats it! You're all set :)"
echo $line
