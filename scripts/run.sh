#!/bin/bash

# main driver for handling each part of configuration and installation
# broken up into multiple sections, each runs a series of smaller scripts

# APT
apt_init.sh

# more stuff

apt_cleanup.sh

# GIT
git_set.sh
