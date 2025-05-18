FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y vsftpd
COPY ./tools/script.sh .
RUN chmod +x script.sh
COPY ./conf/ftp.conf /etc/ftp.conf
CMD [ "./script.sh" ]
