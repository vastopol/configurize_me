#!/bin/bash

# atom package manager
# installs user plugins for the text editor

# see if apm installed
EXISTS1=$(eval "which apm")

if   [ $EXISTS1 != "/usr/bin/apm" ] ; then
    echo "ERROR: package 'apm' not installed"
    exit 1
fi

# process file && try and install packages
APM_FILE="pkg_lists/apm_list.txt"
ARRAY1=() # package names
ARRAY2=() # error indices
ERRVAL=0  # start index

if   ! [ -f $APM_FILE ] ; then
    echo "ERROR: file $APM_FILE does not exist"
    exit 1
fi

echo "installing user packages"

# read file to array
while read -r VAR
do
    ARRAY1+=($VAR)
done < $APM_FILE

if [ ${#ARRAY1[@]} -eq 0  ] ; then
    exit 1
fi

# try install, keep index of errors
for i in "${ARRAY1[@]}"
do
    if ! apm install $i
    then
        echo "Failed to apt install $i"
        ARRAY2+=($ERRVAL)
        let "ERRVAL += 1"
        continue
    fi
    let "ERRVAL += 1"
done

# print packages couldnt install
if ! [ ${#ARRAY2[@]} -eq 0 ] ; then
    date >> error_log.txt
    echo "could not install packages:" >> error_log.txt
    for i in "${ARRAY2[@]}"
    do
        echo ${ARRAY1[$i]} >> error_log.txt
    done
fi

