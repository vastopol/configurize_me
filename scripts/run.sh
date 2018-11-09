#!/bin/bash

# main driver for handling download, installation, setup, and configuration
# in multiple sections, each runs scripts for a specific tool/package manager

# BASH
source bashrc_config.sh

# APT
source apt_config.sh
source apt_extra.sh

# PIP
source pip_config.sh

# GIT
source git_config.sh
source git_downl.sh

# UPGRADE
source upgrade.sh

