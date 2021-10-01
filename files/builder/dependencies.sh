#!/bin/sh

printf "\e[31m\e[1m=================== start building ===================\e[0m\n"
apt-get update
apt-get install -y nginx php7.3-fpm php-mysql -y wget
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
rm -f latest.tar.gz
mv wordpress /var/www/html/wordpress
mv default /etc/nginx/sites-available/
