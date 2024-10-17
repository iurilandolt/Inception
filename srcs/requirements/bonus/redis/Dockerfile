FROM debian:latest

RUN apt-get update && apt-get install -y redis-server

COPY ./conf/redis.conf /etc/redis/redis.conf

RUN echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf

#CMD ["redis-server", "/etc/redis/redis.conf"]
#CMD ["redis-server",  "--protected-mode no"]
#CMD ["redis-server"]
CMD ["tail", "-f", "/dev/null"]