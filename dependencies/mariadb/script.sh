#!/bin/bash

mkdir -p /var/run/mysqld
mkdir -p /var/log/mysql
chown -R mysql:mysql /var/run/mysqld
chown -R mysql:mysql /var/log/mysql
if [ ! -d /var/lib/mysql/mysql ]; then
  mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi
mysqld_safe --datadir=/var/lib/mysql --user=mysql &

until mysqladmin ping -h "127.0.0.1" --silent; do
  echo 'waiting for mysqld to be connectable...'
  sleep 2
done

echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ;" > db.sql
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql
mysql < db.sql
exec mysqld --datadir=/var/lib/mysql --user=mysql &
#PID1
wait
