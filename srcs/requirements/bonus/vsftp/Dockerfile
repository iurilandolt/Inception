FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd openssl

RUN mkdir -p /var/run/vsftpd/cache

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout  /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=PT/L=LISBOA/O=42/OU=student/CN=rlandolt"

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/script.sh /script.sh

RUN chmod +x script.sh

CMD ["./script.sh"]





