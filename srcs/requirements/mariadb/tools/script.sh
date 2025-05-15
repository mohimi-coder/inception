#!/bin/bash
service mariadb start
sleep 5
mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DB\`;"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS \`$MYSQL_USE\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DB\`.* TO \`mhimi\`@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
service mariadb stop
exec mysqld_safe --bind-address=0.0.0.0
