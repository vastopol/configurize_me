#!/bin/bash

# upgrade operating system to latest release

apt install update-manager-core
apt install update-release-upgrader-core
do-release-upgrade

