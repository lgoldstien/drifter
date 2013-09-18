#!/usr/bin/env bash

# Set the root passwords to blank
export DEBIAN_FRONTEND=noninteractive

# Install the mysql server
apt-get install -y mysql-server

# Restart services
service mysql restart