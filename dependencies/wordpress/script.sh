#!/bin/bash
mkdir -p wordpress
cd wordpress


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


php wp-cli.phar --info


chmod +x wp-cli.phar


mv wp-cli.phar /usr/local/bin/wp

wp --info

cd ../var/www/html

rm -rf *


wp core download --allow-root


wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --allow-root


wp core install --url=wpclidemo.dev --title="WP-CLI" --admin_user=wpcli --admin_password="$MYSQL_ROOT_PASSWORD" --admin_email=info@wp-cli.org --allow-root
#######

wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/*/fpm/pool.d/www.conf

mkdir -p /run/php


#wp redis enable --allow-root


/usr/sbin/php-fpm* -F


if curl -s --fail http://localhost:9000; then
  echo "PHP-FPM is running and listening on port 9000"
else
  echo "PHP-FPM is not running or not listening on port 9000"
  exit 1
fi


sleep infinity