#!/bin/sh

apt-get update
apt-get install nginx openssl -y
mkdir   /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=MA/ST=El-Nouaceur/L=Casablanca/O=1337 Network/OU=IT Student/CN=ael-mezz@student.1337.ma"
mv      default /etc/nginx/sites-available/
nginx -g "daemon off;"