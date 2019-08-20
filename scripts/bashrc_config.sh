#!/bin/bash

# add user aliases and functions to the .bashrc file

BRC=~/.bashrc

if ! [ -f $BRC ] ; then
    echo "ERROR: file '~/.bashrc' does not exist"
    exit 1
fi

echo "writing to user .bashrc"

echo "" >> $BRC
echo "#----------------------------------------" >> $BRC
echo "" >> $BRC
echo "# User aliases:" >> $BRC
echo "" >> $BRC

# user aliases
#----------------------------------------

echo "alias gh='echo \"\"; git config -l; echo \"\"'" >> $BRC
echo "alias rewifi='service network-manager restart'" >> $BRC
echo "alias atom='ELECTRON_TRASH=gvfs-trash atom'"    >> $BRC

#----------------------------------------

echo "" >> $BRC
echo "# User functions:" >> $BRC

# user functions
#----------------------------------------

echo '
function git_vast()
{
    GIT_NAME=vastopol
    GIT_EMAIL=classicunix@gmail.com
    GIT_PUSH=simple
    GIT_EDIT=nano

    rm ~/.gitconfig

    git config --global user.name    $GIT_NAME
    git config --global user.email   $GIT_EMAIL
    git config --global push.default $GIT_PUSH
    git config --global core.editor  $GIT_EDIT

    echo ""
    echo "NOW:"
    git config -l
    echo ""
}' >> $BRC

#----------------------------------------

echo "" >> $BRC
echo "# User run on login:" >> $BRC
echo "" >> $BRC

# user commands to run when open terminal
#---------------------------------------

echo "echo \"GIT PROFILE\"" >> $BRC
echo "git config -l | grep \"user.name\"" >> $BRC
echo "echo \"\"" >> $BRC
