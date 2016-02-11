#!/bin/bash

# No need for sudo, this runs as root

# Setup and and repo
apt-get install -y language-pack-en-base
LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

apt-get update

# Install php 7. Use FPM package with nginx setup
apt-get install -y php7.0-fpm

# php7.0-fpm should be /var/run/php/php7.0-fpm.sock