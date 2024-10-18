FROM debian:latest

RUN apt-get update && apt-get install -y vsftpd

RUN mkdir -p /var/run/vsftpd/cache

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/script.sh /script.sh

# RUN useradd -d /var/www ftpuser

# RUN echo "ftpuser:ftppassword" | chpasswd

# RUN chown -R ftpuser:ftpuser /var/www

# CMD ["vsftpd"]

RUN chmod +x script.sh

CMD ["./script.sh"]





