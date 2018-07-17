#!/bin/bash

# probably not a good way to check if exists... fix later
EXISTS1=$(eval "which apt")
EXISTS2=$(eval "which apt-get")
EXISTS3=$(eval "which apt-cache")

# see if minimum requirements installed
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

# preliminary check && update
apt-get check
apt-get update
apt-get upgrade
apt-get dist-upgrade

# try and install mandatory packages for next stages
apt install git
apt install pip2
apt install pip3
apt install npm

echo "main apt install"
# process a text file with the names of packages to install


# after the install process clean up loose ends
apt-get autoclean
apt-get autoremove
etc...
