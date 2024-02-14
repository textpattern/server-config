#!/bin/bash
sudo mkdir -p /etc/nginx/includes/vendors-available/h5bp/
sudo curl -Lo /etc/nginx/includes/vendors-available/h5bp/mime.types https://raw.githubusercontent.com/h5bp/server-configs-nginx/master/mime.types
sudo chown -R root:sudo /etc/nginx/includes/vendors-available/h5bp/
sudo chmod -R 775 /etc/nginx/includes/vendors-available/h5bp/
