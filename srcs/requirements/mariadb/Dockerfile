FROM  debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.

COPY ./tools/script.sh /

RUN chmod +x script.sh

RUN chown -R mysql:mysql /etc/mysql /var/lib/mysql /run/mysqld && chmod 755 /run/mysqld

USER mysql

CMD ["./script.sh"]

