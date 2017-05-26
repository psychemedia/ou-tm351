#!/usr/bin/env bash

THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#Install nginx
#apache2-utils contains htpassword command to configure password used to restrict access to target ports
apt-get update && apt-get install -y nginx apache2-utils
 
#Create a password (test) for user tm351
#If the TMP_PASS var is not set, use the password: tm351
htpasswd -b -c /etc/nginx/.htpasswd tm351 "${TMP_PASS-tm351}"

config="""
##Jupyter notebook running on port 8888 inside the VM
#upstream notebooks {
#  server 127.0.0.1:8888;
#}
 
#OpenRefine running on port 3334 inside the VM
upstream refine {
  server 127.0.0.1:3334;
}

server {
  listen 80;
  location / {
    root /var/www/html ;
    index index.html;
  }
}

# server {
#   #Configure the server to listen on internal port 35180 as an authenticated proxy for internal 8888
#   listen 35180;
#  
#   auth_basic "Protected...";
#   auth_basic_user_file /etc/nginx/.htpasswd;
#  
#   location / {
#     proxy_pass http://notebooks;
#     proxy_redirect off;
#   }
# }
#  
server {
  #Configure the server to listen on internal port 35181 as an authenticated proxy for internal 3334
  listen 35181;
  auth_basic "Protected...";
  auth_basic_user_file /etc/nginx/.htpasswd;
  location / {
    proxy_pass http://refine;
    proxy_redirect off;
  }
}
"""

echo "$config" > /etc/nginx/sites-available/default

mkdir -p /var/www/html
cp -a $THISDIR/www/. /var/www/html

# Refresh service config
systemctl daemon-reload

service nginx reload


