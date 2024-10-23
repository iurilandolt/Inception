#!/bin/bash

if [ ! -f /etc/netdata/stream.conf ]; then
	echo "[global]" >> /etc/netdata/netdata.conf
	echo "	hostname = netdata" >> /etc/netdata/netdata.conf

	echo "[$(cat /run/secrets/apikey)]" >> /etc/netdata/stream.conf
	echo "	enabled = yes" >> /etc/netdata/stream.conf
fi

netdata -D