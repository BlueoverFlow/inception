#!/bin/sh

DIR="/var/www/html/";
apt-get update
apt-get install php7.3-fpm php-mysql php-common php wget -y
rm -rf $DIR/index.nginx-debian.html
if [ "$(ls -A $DIR)" ]
then
echo "$DIR isn't empty running php-fpm in the foreground"
else
    echo "$DIR is Empty \n Copying wordpress..."
    wget    https://wordpress.org/latest.tar.gz
    tar     -xvf latest.tar.gz
    rm      -f latest.tar.gz
    mv      wordpress/* $DIR
    mv      wp-config.php $DIR
    sed -i 's/database_name_here/'${DB_NAME}'/g' $DIR/wp-config.php
    sed -i 's/username_here/'${DB_USER}'/g' $DIR/wp-config.php
    sed -i 's/password_here/'${DB_PASSWORD}'/g' $DIR/wp-config.php
fi
chmod   -R 777 $DIR
chown   -R www-data $DIR
mv /www.conf /etc/php/7.3/fpm/pool.d/www.conf
service php7.3-fpm start
service php7.3-fpm stop
php-fpm7.3 -F -R