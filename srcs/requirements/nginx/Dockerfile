FROM debian:11
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=42/OU=42/CN=mohimi.42.fr/UID=mohimi"
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf
RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
CMD ["nginx", "-g", "daemon off;"]
