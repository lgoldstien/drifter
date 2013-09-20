#!/usr/bin/env bash

# Update apt
apt-get update
# Install basic system utils
apt-get install -y python-software-properties

for argument in "$*"
	do bash /vagrant/vagrant-scripts/bootstrap-$argument.sh
done