#!/bin/bash

# main driver for handling download, installation, setup, and configuration
# in multiple sections, each runs scripts for a specific tool/package manager

# BASH
source brc_config.sh

# APT
source apt_init.sh
source apt_install.sh
source apt_cleanup.sh

# GIT
source git_set.sh

# PIP

# NPM
