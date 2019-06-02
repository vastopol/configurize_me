#!/bin/bash

# install pip packages for python2 && python3

EXISTS1=$(eval "which pip")
EXISTS2=$(eval "which pip3")

if   [ $EXISTS1 != "/usr/bin/pip" ] ; then
    echo "ERROR: package 'pip' not installed"
    exit 1
elif [ $EXISTS2 != "/usr/bin/pip3" ] ; then
    echo "ERROR: package 'pip3' not installed"
    exit 1
fi

PIP_FILE="pkg_lists/pip_list.txt"

if   ! [ -f $PIP_FILE ] ; then
    echo "ERROR: file $PIP_FILE does not exist"
    exit 1
fi

pip  install -r $PIP_FILE
pip3 install -r $PIP_FILE
