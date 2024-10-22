FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server systemctl wget

RUN wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates --stable-channel --disable-telemetry

RUN systemctl start netdata

RUN systemctl enable netdata

CMD ["redis-server", "--protected-mode no", "--maxmemory", "256mb", "--maxmemory-policy", "allkeys-lru"]