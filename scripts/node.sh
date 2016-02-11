#!/bin/bash


apt-get -y install curl
# @todo figure out how to get v5 to install. Still installs legacy version
curl -sL https://deb.nodesource.com/setup_5.x | -E bash -
apt-get update
apt-get install -y nodejs