#!/bin/bash

# Create a new user with a home directory
useradd -m ${FTPUSER}
# Create the WordPress directory if it doesn't exist
mkdir -p /var/www/wordpress
# Change the FTP user's home directory to the WordPress directory
usermod -d /var/www/wordpress ${FTPUSER}
# Add the FTP user to the 'www-data' group (used by Nginx)
usermod -aG www-data ${FTPUSER}
# Set the user's password using environment variable FTPPASS
echo "${FTPUSER}:${FTPPASS}" | chpasswd
# Create an empty directory needed for secure vsftpd setup
mkdir -p /var/run/vsftpd/empty
# Append additional FTP configuration to the main vsftpd config file
cat /etc/ftp.conf >> /etc/vsftpd.conf
#remove ftp.conf tmp file
rm -f /etc/ftp.conf
# Start the vsftpd FTP server using the final config
vsftpd /etc/vsftpd.conf
