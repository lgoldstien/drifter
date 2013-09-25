#!/usr/bin/env bash

# Install the web server
apt-get install -y nginx php5-fpm php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl

# Set up the www folder properly


# Restart services
service nginx restart
service php5-fpm restart