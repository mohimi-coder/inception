#!/bin/bash
service mariadb start
sleep 5
mysqladmin -u root password "123"
mysql -e "CREATE DATABASE IF NOT EXISTS \`mohimi-db\`;"
mysql -e "CREATE USER IF NOT EXISTS \`mhimi\`@'%' IDENTIFIED BY '2025';"
mysql -e "GRANT ALL PRIVILEGES ON \`mohimi-db\`.* TO \`mhimi\`@'%' IDENTIFIED BY '2025' ;"
mysql -e "FLUSH PRIVILEGES;"
service mariadb stop
exec mysqld_safe --bind-address=0.0.0.0
