#!/bin/bash

# Variables
BASE_APP_DIR="/home/ubuntu/app"

# Install Python related packages
sudo apt-get -y update
sudo apt-get -y install python3 python3-pip

# Install app dependencies
cd $BASE_APP_DIR/src
pip3 install --quiet -r requirements.txt

# Install and start app service
cd $BASE_APP_DIR/scripts
sudo cp app.service /etc/systemd/system/app.service
sudo systemctl enable app
sudo systemctl start app