#!/bin/bash
echo "Downloading wp-cli.phar ..."
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
echo "Creating WordPress directory at /var/www/wordpress ..."
mkdir -p /var/www/wordpress/
echo "Making wp-cli.phar executable ..."
chmod +x wp-cli.phar
echo "Moving wp-cli.phar to /usr/local/bin/wp ..."
mv wp-cli.phar /usr/local/bin/wp
echo "Setting permissions on the WordPress directory ..."
chmod -R 777 /var/www/wordpress/
echo "go inside /var/www/wordpress ..."
cd /var/www/wordpress
echo "ensures that the web server has the correct access ..."
chown -R www-data:www-data /var/www/wordpress
#---------------------------------------------------wordpress installation-------------
wp core download --allow-root
wp core config --dbhost=mariadb:3306 --dbname="mohimi-db" --dbuser="mhimi" --dbpass="2025" --allow-root
wp core install --url="localhost" --title="hello" --admin_user="hhimi" --admin_password="1111" --admin_email="hhimi@gmail.com" --allow-root
wp user create "ohimi" "ohimi@gmail.com" --user_pass="2222" --role="author" --allow-root

#---------------------------------------------------php config---------------------------------------------------#
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F
