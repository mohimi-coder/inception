#!/bin/bash

useradd -m ${FTPUSER}

mkdir -p /var/www/wordpress

usermod -d /var/www/wordpress ${FTPUSER}

usermod -aG www-data ${FTPUSER}

echo "${FTPUSER}:${FTPPASS}" | chpasswd

mkdir -p /var/run/vsftpd/empty

cat /etc/ftp.conf >> /etc/vsftpd.conf
rm -f /etc/ftp.conf

vsftpd /etc/vsftpd.conf
