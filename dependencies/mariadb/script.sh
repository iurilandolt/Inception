#!/bin/bash

mkdir -p /run/mysqld
touch /etc/mysql/init.sql

echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ;" > /etc/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' ;" >> /etc/mysql/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" >> /etc/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

mysqld < /etc/mysql/init.sql 


