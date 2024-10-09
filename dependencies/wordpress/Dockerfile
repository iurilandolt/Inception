FROM debian:stable

RUN apt-get update && apt-get install -y wordpress curl php-fpm php-mysql

COPY script.sh /

RUN chmod +x script.sh

#CMD ["./script.sh"]