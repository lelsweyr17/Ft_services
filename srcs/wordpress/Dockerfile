FROM alpine:3.12

RUN apk update
RUN apk add openrc
RUN apk add nginx supervisor
RUN apk add wget && mkdir /www \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget -P /tmp https://wordpress.org/latest.tar.gz
RUN	tar -xf /tmp/latest.tar.gz -C /tmp/
RUN	mv /tmp/wordpress /www/
RUN	rm -rf /tmp/*

COPY /srcs/start.sh .
COPY /srcs/wp-config.php /www/wp-config.php
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY /srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 5050

CMD ["sh", "start.sh"]
