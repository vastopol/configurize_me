#!/bin/bash

# install specified git repositories to a new folder on the desktop
# process git_list.txt go through file in a loop cloning the repos to the folder

EXISTS1=$(eval "which git")

if [ $EXISTS1 != "/usr/bin/git" ] ; then
    echo "ERROR: package 'git' not installed"
    exit 1
fi

GIT_FILE="git_list.txt"
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

cd ~/Desktop
mkdir git_repos
cd git_repos

for i in "${GIT_REPOS[@]}"
do
    echo $i
    git clone $i
done

