FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add vsftpd openssl openrc

COPY ./srcs ./src
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/vsftpd.key \
    -out /etc/ssl/certs/vsftpd.crt \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21School/OU=lelsweyr/CN=ftps"

RUN adduser -D -h /var/ftp lelsweyr; echo "lelsweyr:root" | chpasswd
RUN mkdir -p /var/ftp
RUN cp /src/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN chmod 777 /src/start.sh

EXPOSE 20 21 30000

CMD ["sh", "/src/start.sh"]