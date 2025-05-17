#!/bin/bash
#Downloading wp-cli.phar
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#Creating WordPress directory at /var/www/wordpress
mkdir -p /var/www/wordpress/
# Making wp-cli.phar executable
chmod +x wp-cli.phar
#Moving wp-cli.phar to /usr/local/bin/wp
mv wp-cli.phar /usr/local/bin/wp
#Setting permissions on the WordPress directory
chmod -R 777 /var/www/wordpress/
#go inside /var/www/wordpress
cd /var/www/wordpress
#ensures that the web server has the correct access
chown -R www-data:www-data /var/www/wordpress
#---------------------------------------------------wordpress installation-------------
wp core download --allow-root
wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root
wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password="$WP_ADMIN_P" --admin_email="$WP_ADMIN_E" --allow-root
wp user create "$WP_U_NAME" "$WP_U_EMAIL" --user_pass="$WP_U_PASS" --role="$WP_U_ROLE" --allow-root

wp plugin install redis-cache --activate --allow-root
wp config set WP_CACHE true --path="/var/www/wordpress" --allow-root
wp config set WP_REDIS_HOST "redis" --allow-root
wp config set WP_REDIS_PORT "6379" --allow-root
wp redis enable redis-cache --allow-root

#---------------------------------------------------php config---------------------------------------------------#
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F
