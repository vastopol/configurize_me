#!/bin/bash

# add user aliases to the bashrc file

BRC="~/.bashrc"

if ! [ -f $BRC ] ; then
	echo "ERROR: file '~/.bashrc' not exist"
	exit 1
fi

echo ".bashrc config"
echo "adding user aliases"

# add aliases
echo "" >> $BRC
echo "# User aliases:" >> $BRC
echo "alias gh='git config -l'" >> $BRC
echo "alias rewifi='service network-manager restart'" >> $BRC
