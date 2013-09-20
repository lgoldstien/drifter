#!/usr/bin/env bash

# Set the root passwords to blank
export DEBIAN_FRONTEND=noninteractive

# Install the mysql server
apt-get install -y mysql-server

# Run any sql queries against the database
for argument in /vagrant/sql/*
	do mysql -u root < $argument
done

# Restart services
service mysql restart