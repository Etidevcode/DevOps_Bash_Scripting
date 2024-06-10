#
# Copyright (c) - All Rights Reserved.
#

#!/bin/bash

# Installing Dependencies
echo "##############################"
echo "Installing packages."
sudo yum install wget unzip httpd -y > /dev/null
echo

# Start & Enable Service
echo "##############################"
echo "Start & Enable HTTPD Service"
echo "##############################"
systemctl start httpd
systemctl enable httpd
echo

# Creating Temp Directory
echo "##############################"
echo "Starting Artifact Deployment"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

# Bounce Service
echo "##############################"
echo "Restarting HTTPD service"
echo "##############################"
systemctl restart httpd
echo

# Clean Up
echo "##############################"
echo "Removing Temporary Files"
echo "##############################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html/
