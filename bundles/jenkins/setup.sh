#!/usr/bin/env bash

# Add jenkins repo
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo 'deb http://pkg.jenkins-ci.org/debian binary/' >> /etc/apt/sources.list.d/jenkins.sources.list
# Install jenkins
apt-get update
apt-get install -y jenkins

# Set up networking
#ifconfig eth1 188.40.241.241 netmask 255.255.255.240 up
