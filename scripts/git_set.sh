#!/bin/bash

GIT_NAME=vastopol
GIT_EMAIL=classicunix@gmail.com

echo "OLD:"
git config -l
rm ~/.gitconfig

git config --global push.default simple
git config --global user.name  $GIT_NAME
git config --global user.email $GIT_EMAIL

echo "NEW:"
git config -l
