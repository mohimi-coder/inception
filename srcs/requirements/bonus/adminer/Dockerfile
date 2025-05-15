FROM debian:11
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y wget php php-mysqli
COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh && /script.sh
ENTRYPOINT [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/html" ]