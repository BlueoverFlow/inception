#!/bin/sh

apt-get update
apt-get install mariadb-server ufw iptables -y
ufw allow 3306
mv /conf /etc/mysql/mariadb.conf.d/50-server.cnf
if [ -d "/var/lib/mysql/${DB_NAME}" ]
then
echo "Directory already exist"
else
    service mysql start
    mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'"
    mysql -u root -e "CREATE DATABASE ${DB_NAME};"
    mysql -u root -e "use ${DB_NAME}; GRANT ALL PRIVILEGES ON * TO '${DB_USER}'@'%'; FLUSH PRIVILEGES;"
    mysql -u root ${DB_NAME} < wp_db.sql
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
fi
mysqld_safe