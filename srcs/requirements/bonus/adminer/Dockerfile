FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	php \
	php-mysql \
	wget

RUN wget http://www.adminer.org/latest.php -O /var/www/html/index.php 

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]

