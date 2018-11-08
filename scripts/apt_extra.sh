#!/bin/bash

# extra installs
# might not be correct

# figure out how to do google chrome

# electrum 2.9.3
sudo apt-get install python-qt4 python-pip
sudo pip2 install https://download.electrum.org/2.9.3/Electrum-2.9.3.tar.gz

# atom text editor
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt install atom

# ubuntu mate desktop
sudo apt-add-repository ppa:ubuntu-mate-dev/ppa
sudo apt-add-repository ppa:ubuntu-mate-dev/trusty-mate
sudo apt-get install ubuntu-mate-core ubuntu-mate-desktop

# java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java9-installer

