FROM debian:bullseye

RUN apt-get update && apt-get install -y redis-server systemctl wget

RUN wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates --stable-channel --disable-telemetry

# COPY ./conf/netdata.conf /etc/netdata/netdata.conf

# COPY ./conf/stream.conf /etc/netdata/stream.conf

# CMD ["redis-server", "--protected-mode no", "--maxmemory", "256mb", "--maxmemory-policy", "allkeys-lru"]

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]