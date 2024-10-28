#!/bin/bash

if [ ! -f /etc/mysql/init.sql ]; then
	
	# useradd -m -d /var/lib/mysql $(cat /run/secrets/wpmngr)
	# echo ""$(cat /run/secrets/wpmngr)":"$(cat /run/secrets/dbpsw)"" | chpasswd
	# sed -i 's/user                    = mysql/user                    = '$(cat /run/secrets/wpmngr)/'' /etc/mysql/mariadb.conf.d/50-server.cnf
	# chown -R $(cat /run/secrets/wpmngr):$(cat /run/secrets/wpmngr) /etc/mysql /var/lib/mysql /run/mysqld
	# chmod 755 /run/mysqld

	touch /etc/mysql/init.sql
	echo "CREATE DATABASE IF NOT EXISTS $(cat /run/secrets/dbname) ;" > /etc/mysql/init.sql
	echo "CREATE USER IF NOT EXISTS '$(cat /run/secrets/dbusr)'@'%' IDENTIFIED BY '$(cat /run/secrets/dbusrpsw)' ;" >> /etc/mysql/init.sql
	echo "GRANT ALL PRIVILEGES ON $(cat /run/secrets/dbname).* TO '$(cat /run/secrets/dbusr)'@'%' WITH GRANT OPTION;" >> /etc/mysql/init.sql
	# echo "ALTER USER '$(cat /run/secrets/wpmngr)'@'localhost' IDENTIFIED BY '$(cat /run/secrets/dbpsw)' ;" >> /etc/mysql/init.sql
	echo "ALTER USER 'mysql'@'localhost' IDENTIFIED BY '$(cat /run/secrets/dbpsw)' ;" >> /etc/mysql/init.sql
	echo "FLUSH PRIVILEGES;" >> /etc/mysql/init.sql
	mysql_install_db
fi

# mysqld -u $(cat /run/secrets/wpmngr)

mysqld


