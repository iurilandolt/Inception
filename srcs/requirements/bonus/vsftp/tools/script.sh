#!/bin/bash

useradd -d /var/www/ $(cat /run/secrets/wpusr)

echo ""$(cat /run/secrets/wpusr)":"$(cat /run/secrets/wpusrpsw)"" | chpasswd

chown -R $(cat /run/secrets/wpusr):$(cat /run/secrets/wpusr) /var/www/

vsftpd