#!/bin/bash

# add user aliases and functions to the .bashrc file

BRC="~/.bashrc"

if ! [ -f $BRC ] ; then
    echo "ERROR: file '~/.bashrc' does not exist"
    exit 1
fi

echo "writing to user .bashrc"

echo "" >> $BRC
echo "#----------------------------------------" >> $BRC
echo "" >> $BRC
echo "# User aliases:" >> $BRC

# user aliases
#----------------------------------------

echo "alias gh='git config -l'" >> $BRC
echo "alias rewifi='service network-manager restart'" >> $BRC

#----------------------------------------

echo "" >> $BRC
echo "# User functions:" >> $BRC

# user functions
#----------------------------------------

echo '
function git_srich()
{
    GIT_NAME=srich009
    GIT_EMAIL=srich009@ucr.edu
    GIT_PUSH=simple
    GIT_EDIT=nano

    echo "OLD:"
    git config -l
    rm ~/.gitconfig

    git config --global user.name    $GIT_NAME
    git config --global user.email   $GIT_EMAIL
    git config --global push.default $GIT_PUSH
    git config --global core.editor  $GIT_EDIT

    echo "NEW:"
    git config -l
}
' >> $BRC

echo '
function git_vast()
{
    GIT_NAME=vastopol
    GIT_EMAIL=classicunix@gmail.com
    GIT_PUSH=simple
    GIT_EDIT=nano

    echo "OLD:"
    git config -l
    rm ~/.gitconfig

    git config --global user.name    $GIT_NAME
    git config --global user.email   $GIT_EMAIL
    git config --global push.default $GIT_PUSH
    git config --global core.editor  $GIT_EDIT

    echo "NEW:"
    git config -l
}
' >> $BRC

#----------------------------------------
