#!/bin/bash
service mariadb start
#Waits 5 seconds to give MariaDB time to fully initialize before issuing commands.
sleep 5
mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"
# Connects to MariaDB as root and creates a database named $MYSQL_DB if it doesn't already exist.
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DB\`;"
# Creates a MariaDB user $MYSQL_USE with password $MYSQL_PASSWORD, allowing access from any host ('%').
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS \`$MYSQL_USE\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# Grants all privileges on the $MYSQL_DB database to the user mhimi from any host, also specifying the password.
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DB\`.* TO \`mhimi\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;"
# Reloads the privileges so MariaDB recognizes the changes immediately.
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
# Stops the MariaDB server. This is done because the script wants to launch the MariaDB daemon differently next.
service mariadb stop
# Replaces the current shell process with the MariaDB safe daemon process, binding it to all IP addresses (listening on all interfaces)
exec mysqld_safe --bind-address=0.0.0.0
