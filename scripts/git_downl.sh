#!/bin/bash

# install specified git repositories to a new folder on the desktop
# process git_list.txt go through file in a loop cloning the repos to the folder

# if misspelled link will ask to sign in.
# then press Ctrl-D to stop that clone and goto next

EXISTS1=$(eval "which git")

if [ $EXISTS1 != "/usr/bin/git" ] ; then
    echo "ERROR: package 'git' not installed"
    exit 1
fi

GIT_FILE="pkg_lists/git_list.txt"
GIT_REPOS=()

if ! [ -f $GIT_FILE ] ; then
    echo "ERROR: file $GIT_FILE does not exist"
    exit 1
fi

while read -r TXT
do
    GIT_REPOS+=("$TXT")
done < $GIT_FILE

if [ ${#GIT_REPOS[@]} -eq 0  ] ; then
    exit 1
fi

OLD_DIR=$(eval "pwd")
cd ~/Desktop
mkdir git_repos
cd git_repos

# try install, keep index of errors
for i in "${GIT_REPOS[@]}"
do
    if ! git clone $i
    then
        echo "Failed to git clone $i"
        ARRAY2+=($ERRVAL)
        let "ERRVAL += 1"
        continue
    fi
    let "ERRVAL += 1"
done

# print repos couldnt clone
if ! [ ${#ARRAY2[@]} -eq 0 ] ; then
    date >> "$OLD_DIR"/error_log.txt
    echo "could not clone:" >> "$OLD_DIR"/error_log.txt
    for i in "${ARRAY2[@]}"
    do
        echo ${GIT_REPOS[$i]} >> "$OLD_DIR"/error_log.txt
    done
fi

