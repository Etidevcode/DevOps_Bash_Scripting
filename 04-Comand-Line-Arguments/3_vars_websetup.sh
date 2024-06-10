#
# Copyright (c) - All Rights Reserved.
#

#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "##############################"
echo "Installing packages."
sudo yum install $PACKAGE -y > /dev/null
echo

# Start & Enable Service
echo "##############################"
echo "Start & Enable HTTPD Service"
echo "##############################"
systemctl start $SVC
systemctl enable $SVC
echo

# Creating Temp Directory
echo "##############################"
echo "Starting Artifact Deployment"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo
#!/bin/bash

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
echo

# Bounce Service
echo "##############################"
echo "Restarting HTTPD service"
echo "##############################"
systemctl restart $SVC
echo

# Clean Up
echo "##############################"
echo "Removing Temporary Files"
echo "##############################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html/
