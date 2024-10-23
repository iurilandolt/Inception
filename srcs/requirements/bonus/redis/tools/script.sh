#!/bin/bash

if [ ! -f /etc/netdata/stream.conf ]; then
	echo "[global]" >> /etc/netdata/netdata.conf
	echo "	hostname = redis" >> /etc/netdata/netdata.conf

	echo "[stream]" >> /etc/netdata/stream.conf
	echo "	enabled = yes" >> /etc/netdata/stream.conf
	echo "	destination = netdata:19999" >> /etc/netdata/stream.conf
	echo "	api key = $(cat /run/secrets/apikey)" >> /etc/netdata/stream.conf
fi

systemctl start netdata

redis-server --protected-mode no --maxmemory 256mb --maxmemory-policy allkeys-lru

