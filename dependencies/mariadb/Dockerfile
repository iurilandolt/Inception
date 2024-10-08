FROM  debian:stable

RUN apt-get update && apt-get install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/

COPY script.sh /

RUN chmod +x script.sh

CMD ["./script.sh"]