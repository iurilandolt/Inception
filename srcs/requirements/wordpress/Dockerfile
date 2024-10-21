FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php-fpm php-mysqli

COPY ./tools/script.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

RUN mkdir -p /run/php

RUN chmod +x script.sh

CMD ["./script.sh"]