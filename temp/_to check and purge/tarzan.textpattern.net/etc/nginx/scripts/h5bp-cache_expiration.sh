#!/bin/bash
sudo mkdir -p /etc/nginx/includes/vendors-available/h5bp/
sudo curl -Lo /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf https://raw.githubusercontent.com/h5bp/server-configs-nginx/main/h5bp/web_performance/cache_expiration.conf
sudo chown -R root:sudo /etc/nginx/includes/vendors-available/h5bp/
sudo chmod -R 775 /etc/nginx/includes/vendors-available/h5bp/
sudo sed -i '/^[[:space:]]*$/d' /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf
sudo sed -i '/^#/d' /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf
sudo sed -i '/^}/d' /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf
sudo sed -i '/^expires/d' /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf
sudo sed -i '/^map/d' /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf
sudo sed -i '/^  #/d' /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf
sudo sed -i 's/^  //g' /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf
sudo sed -i 's/  */ /g' /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf
sudo sed -i 's/^/    /g' /etc/nginx/includes/vendors-available/h5bp/cache_expiration.conf
