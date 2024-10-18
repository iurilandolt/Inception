FROM debian:latest

RUN apt-get update && apt-get install -y redis-server systemctl

# COPY ./conf/redis.conf /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode no", "--maxmemory", "256mb", "--maxmemory-policy", "allkeys-lru"]