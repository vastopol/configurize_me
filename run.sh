#!/bin/bash

# main driver for handling download, installation, setup, and configuration
# in multiple sections, each runs scripts for a specific tool/package manager

# BASH
source scripts/bashrc_config.sh

# APT
source scripts/apt_config.sh
source scripts/apt_extra.sh

# PIP
source scripts/pip_config.sh

# GIT
source scripts/git_config.sh
source scripts/git_downl.sh

# ATOM APM
source scripts/apm_config.sh

# OS UPGRADE
source scripts/upgrade.sh

