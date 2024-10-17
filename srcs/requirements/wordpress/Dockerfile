FROM debian:stable

RUN apt-get update && apt upgrade && apt-get install -y wordpress curl php-fpm php-mysqli

COPY script.sh /

COPY www.conf /etc/php/8.2/fpm/pool.d/.

RUN chmod +x script.sh

CMD ["./script.sh"]