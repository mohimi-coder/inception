FROM debian:11
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php7.4-fpm php-mysql mariadb-client
COPY ./tools/script.sh /
RUN  chmod +x /script.sh
ENTRYPOINT ["/script.sh"]