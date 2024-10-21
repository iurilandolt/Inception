#!/bin/bash

if [ ! -f /etc/mysql/init.sql ]; then
	touch /etc/mysql/init.sql
	echo "CREATE DATABASE IF NOT EXISTS $(cat /run/secrets/dbname) ;" > /etc/mysql/init.sql
	echo "CREATE USER IF NOT EXISTS '$(cat /run/secrets/dbusr)'@'%' IDENTIFIED BY '$(cat /run/secrets/dbusrpsw)' ;" >> /etc/mysql/init.sql
	echo "GRANT ALL PRIVILEGES ON $(cat /run/secrets/dbname).* TO '$(cat /run/secrets/dbusr)'@'%' WITH GRANT OPTION;" >> /etc/mysql/init.sql
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(cat /run/secrets/dbpsw)' ;" >> /etc/mysql/init.sql
	echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql
	mysql_install_db
fi

mysqld 


