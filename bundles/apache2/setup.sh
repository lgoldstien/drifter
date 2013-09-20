#!/usr/bin/env bash

# Install the web server
apt-get install -y apache2 php5 php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl

# Remove normal www files
rm -Rf /var/www/index.html

# Copy in the required file tree
cp -R /vagrant/bundles/apache2/files/* /

# Setup phpsysinfo
cd /var/www
git clone https://github.com/rk4an/phpsysinfo.git sysinfo
cd sysinfo
mv phpsysinfo.ini.new phpsysinfo.ini
cd ~

# Start services
service apache2 restart