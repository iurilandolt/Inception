#!/bin/bash
mkdir -p wordpress
cd wordpress


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


php wp-cli.phar --info


chmod +x wp-cli.phar


mv wp-cli.phar /usr/local/bin/wp

wp --info

cd ../var/www/html

#rm -rf *


#wp core download --allow-root


#wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --allow-root


#wp core install --url=wpclidemo.dev --title="WP-CLI" --admin_user=wpcli --admin_password="$MYSQL_ROOT_PASSWORD" --admin_email=info@wp-cli.org --allow-root


/usr/sbin/php-fpm* -F


