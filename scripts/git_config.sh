#!/bin/bash

# setup basic git configuration 

EXISTS1=$(eval "which git")

if [ "$EXISTS1" != "/usr/bin/git" ] ; then
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
