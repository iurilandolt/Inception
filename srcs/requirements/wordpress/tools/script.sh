#!/bin/bash

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --dbname="$(cat /run/secrets/dbname)" --dbuser="$(cat /run/secrets/wpusr)" --dbpass="$(cat /run/secrets/wpusrpsw)" --dbhost="$(cat /run/secrets/dbhost)" --allow-root

wp core install --url=localhost --title="inception" --admin_user="$(cat /run/secrets/wpmngr)" --admin_password="$(cat /run/secrets/dbpsw)" --admin_email=rlandolt@student.42lisboa.com --allow-root

wp user create "$(cat /run/secrets/wpusr)" "$(cat /run/secrets/wpusr)"@"$HOSTNAME".com --role=author --user_pass="$(cat /run/secrets/wpusrpsw)" --allow-root

rm -rf ~/run/secrets/

php-fpm8.2 -F




