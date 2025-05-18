FROM debian:bullseye

RUN apt-get update && apt-get -y upgrade && apt-get install -y wget
RUN wget https://github.com/portainer/portainer/releases/download/2.27.4/portainer-2.27.4-linux-amd64.tar.gz -O p.tar
RUN tar -xf p.tar
RUN rm -f p.tar
CMD ["./portainer/portainer"]