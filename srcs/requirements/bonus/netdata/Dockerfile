FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt-get install wget -y

RUN wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh --no-updates --stable-channel --disable-telemetry

COPY ./conf/netdata.conf /etc/netdata/netdata.conf

COPY ./conf/stream.conf /etc/netdata/stream.conf

CMD ["netdata", "-D"]
