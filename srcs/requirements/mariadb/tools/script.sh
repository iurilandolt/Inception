#!/bin/bash

mkdir -p /run/mysqld
touch /etc/mysql/init.sql

echo "CREATE DATABASE IF NOT EXISTS $(cat /run/secrets/dbname) ;" > /etc/mysql/init.sql
echo "CREATE USER IF NOT EXISTS '$(cat /run/secrets/dbusr)'@'%' IDENTIFIED BY '$(cat /run/secrets/dbusrpsw)' ;" >> /etc/mysql/init.sql
echo "GRANT ALL PRIVILEGES ON $(cat /run/secrets/dbname).* TO '$(cat /run/secrets/dbusr)'@'%' WITH GRANT OPTION;" >> /etc/mysql/init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat /run/secrets/dbpsw)' ;" >> /etc/mysql/init.sql
echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

# echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ;" > /etc/mysql/init.sql
# echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;" >> /etc/mysql/init.sql
# echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;" >> /etc/mysql/init.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;" >> /etc/mysql/init.sql
# echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql

rm -rf ~/run/secrets/
mysql_install_db 
mysqld #< /etc/mysql/init.sql 


