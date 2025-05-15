FROM debian:11
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y redis-server
# COPY ./tools/script.sh /script.sh
# RUN chmod +x /script.sh && /script.sh
ENTRYPOINT [ "redis-server", "--protected-mode", "no" ]