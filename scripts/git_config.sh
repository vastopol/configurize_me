#!/bin/bash

# note this script is the basis of 2 functions which are in bashrc_config.sh

EXISTS1=$(eval "which git")

if   [ $EXISTS1 != "/usr/bin/git" ] ; then
    echo "ERROR: package 'git' not installed"
    exit 1
fi

GIT_PUSH=simple
GIT_NAME=vastopol
GIT_EMAIL=classicunix@gmail.com
GIT_EDIT=nano

echo "OLD:"
git config -l
rm ~/.gitconfig

git config --global push.default $GIT_PUSH
git config --global user.name    $GIT_NAME
git config --global user.email   $GIT_EMAIL
git config --global core.editor  $GIT_EDIT

echo "NEW:"
git config -l
