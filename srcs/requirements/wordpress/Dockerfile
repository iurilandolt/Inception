FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php-fpm php-mysqli

COPY ./tools/script.sh /

# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = wordpress:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php

RUN chmod +x script.sh

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --path=/var/www/html --allow-root

CMD ["/script.sh"]