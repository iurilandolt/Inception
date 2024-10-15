#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --allow-root

wp core install --url=localhost --title="inception" --admin_user=wpcli --admin_password="$MYSQL_ROOT_PASSWORD" --admin_email=rlandolt@student.42lisboa.com --allow-root

wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_USER@localhost.com --role=author --user_pass=$WORDPRESS_DB_PASSWORD --allow-root

php-fpm8.2 -F




