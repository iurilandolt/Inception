#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
	wp config create --dbname="$(cat /run/secrets/dbname)" --dbuser="$(cat /run/secrets/wpusr)" --dbpass="$(cat /run/secrets/wpusrpsw)" --dbhost="$(cat /run/secrets/dbhost)" --allow-root
	wp core install --url=rlandolt.42.fr --title="inception" --admin_user="$(cat /run/secrets/wpmngr)" --admin_password="$(cat /run/secrets/dbpsw)" --admin_email=rlandolt@student.42lisboa.com --allow-root
	wp user create "$(cat /run/secrets/wpusr)" "$(cat /run/secrets/wpusr)"@"$HOSTNAME".com --role=author --user_pass="$(cat /run/secrets/wpusrpsw)" --allow-root
	wp theme install skatepark --activate --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp config set WP_REDIS_HOST 'redis' --type=constant --allow-root
	wp config set WP_REDIS_PORT 6379 --type=constant --raw --allow-root
	wp config set WP_CACHE true --type=constant --raw --allow-root
    wp redis enable --allow-root
fi

php-fpm7.4 -F









