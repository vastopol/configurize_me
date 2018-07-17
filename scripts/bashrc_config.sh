#!/bin/bash

# add user aliases to the bashrc file

BRC="~/.bashrc"

if ! [ -f $BRC ] ; then
    echo "ERROR: file '~/.bashrc' not exist"
    exit 1
fi

echo ".bashrc config"

echo "#----------------------------------------" >> $BRC

# aliases
echo "" >> $BRC
echo "# User aliases:" >> $BRC

echo "alias gh='git config -l'" >> $BRC
echo "alias rewifi='service network-manager restart'" >> $BRC

# functions
echo "" >> $BRC
echo "# User functions:" >> $BRC

echo '
function git_srich()
{
    GIT_PUSH=simple
    GIT_NAME=srich009
    GIT_EMAIL=srich009@ucr.edu
    GIT_EDIT=nano

    git config --global push.default $GIT_PUSH
    git config --global user.name    $GIT_NAME
    git config --global user.email   $GIT_EMAIL
    git config --global core.editor  $GIT_EDIT

    echo "NEW:"
    git config -l
}
' >> $BRC

echo '
function git_vast()
{
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
}
' >> $BRC


# this would be good to maybe have an array fof string commands and a for loop
# name_arr = { name1, name2, ... }
# str_arr = { 'str1', 'str2', ...}
# for each
# line =  "alias " + $name + "=" + $str
# echo $line >> $BRC
# done
