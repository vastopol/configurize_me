#!/bin/bash

# setup basic git configuration then install specified git repositories to a new folder on the desktop

EXISTS1=$(eval "which git")

if [ $EXISTS1 != "/usr/bin/git" ] ; then
    echo "ERROR: package 'git' not installed"
    exit 1
fi

GIT_NAME=vastopol
GIT_EMAIL=classicunix@gmail.com
GIT_PUSH=simple
GIT_EDIT=nano

git config --global user.name    $GIT_NAME
git config --global user.email   $GIT_EMAIL
git config --global push.default $GIT_PUSH
git config --global core.editor  $GIT_EDIT

GIT_FILE="git_list.txt"

if ! [ -f $GIT_FILE ] ; then
    echo "ERROR: file $GIT_FILE does not exist"
    exit 1
fi

GIT_FOLDER="~/Desktop/git_repos"
mkdir $GIT_FOLDER

# process git_list.txt
# go through file in a loop cloning the repos to the folder
# can do something like "git clone https://github.com/user/repo.git path/to/folder"
