#!/bin/bash

# script will first update/upgrade packages and distribution
# then install requirements and the user's packages
# final will clean and remove not needed packages

# see if apt installed
EXISTS1=$(eval "which apt")
EXISTS2=$(eval "which apt-get")
EXISTS3=$(eval "which apt-cache")

if   [ $EXISTS1 != "/usr/bin/apt" ] ; then
    echo "ERROR: package 'apt' not installed"
    exit 1
elif [ $EXISTS2 != "/usr/bin/apt-get" ] ; then
    echo "ERROR: package 'apt-get' not installed"
    exit 1
elif [ $EXISTS3 != "/usr/bin/apt-cache" ] ; then
    echo "ERROR: package 'apt-cache' not installed"
    exit 1
fi

# preliminary checks && updates
apt-get check
apt-get update
apt-get upgrade
apt-get dist-upgrade
apt install update-manager-core
do-release-upgrade

# install mandatory packages for next stages
echo "installing required packages"
apt install git
apt install python-pip
apt install python3-pip

# install packages from user file
APT_FILE="apt_list.txt"

if   ! [ -f $APT_FILE ] ; then
    echo "ERROR: file $APT_FILE does not exist"
    exit 1
fi

echo "installing user packages"


# process text file with the names of packages to install
echo "fixme not done yet"
cat apt_list.text


# after the install process clean up loose ends
apt-get autoclean
apt-get autoremove
