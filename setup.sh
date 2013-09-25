#!/bin/bash

# Clear the screen
clear

# Echo welcome
echo "Welcome to the drifter setup script."
echo ""
echo "This will guide you through getting a vagrant infrastructure up and running."
echo ""
echo "Checking compatability..."

# Make sure we are running as root.
if [ "$(id -u)" != "0" ]; then
   echo -e "\033[91mWait a minute, we aren't running as root. You need to use sudo or login as root to run this setup.\033[0m" 1>&2
   exit 1
fi

# Make sure we are running ubuntu
if [ ! -e "/etc/lsb-release" ]; then
  echo -e "\033[91mSorry, but we can only run on Ubuntu.\033[0m"
  exit 1
fi

# Store the distribution name
OS_DIST_NAME=`cat /etc/lsb-release | grep DISTRIB_CODENAME`
OS_DIST_NAME=${OS_DIST_NAME:17}

# Store the cpu architecture
HARDWARE_ARCH=`uname -p`

# Make sure we have sudo installed
echo "Ensuring required software is installed..."
apt-get update > /dev/null
apt-get install -y sudo software-properties-common > /dev/null
echo "Adding Vagrant..."
wget --quiet http://files.vagrantup.com/packages/db8e7a9c79b23264da129f55cf8569167fc22415/vagrant_1.3.3_$HARDWARE_ARCH.deb
dpkg --install vagrant_1.3.3_$HARDWARE_ARCH.deb > /dev/null
rm vagrant_1.3.3_$HARDWARE_ARCH.deb

echo "Adding Virtualbox..."
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add - > /dev/null
add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $OS_DIST_NAME contrib"
apt-get update > /dev/null
apt-get install -y virtualbox-4.2 > /dev/null

echo "Creating the drifter user..."

# Set up the drifter user
if [ ! $(id -u drifter) = "" ]; then
    useradd --create-home drifter
    passwd drifter
fi

# Add drifter to the sudoers file
echo "Adding drifter user to the sudoers file..."
if [ -z `grep drifter "/etc/sudoers"` ]; then
    echo "drifter ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
fi

# Create the /usr/share/drifter folder and set permissions
echo "Creating required folders..."
if [ ! -d "/usr/share/drifter" ]; then
    mkdir /usr/share/drifter
fi
echo "Setting permissions..."
chown drifter /usr/share/drifter
chgrp drifter /usr/share/drifter
chmod +r /usr/share/drifter

# Create box store
echo "Creating box store..."
if [ ! -d "/usr/share/drifter/boxes" ]; then
    mkdir /usr/share/drifter/boxes
fi
