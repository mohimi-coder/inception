FROM debian:11

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y mariadb-server netcat
COPY ./tools/script.sh /script.sh

RUN chmod +x /script.sh

ENTRYPOINT [ "/script.sh" ]
