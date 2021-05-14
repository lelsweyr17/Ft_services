FROM alpine:3.12

EXPOSE 5000

RUN apk update
RUN apk add openrc
RUN apk add nginx supervisor
RUN apk add wget && mkdir /www \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

COPY ./srcs ./src
RUN wget -P /tmp https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xf /tmp/phpMyAdmin-5.0.4-all-languages.tar.gz -C /tmp/
RUN mv /tmp/phpMyAdmin-5.0.4-all-languages /www/phpmyadmin
RUN rm -rf /tmp/*

RUN cp /src/nginx.conf /etc/nginx/conf.d/default.conf
RUN cp /src/supervisord.conf /etc/supervisord.conf
RUN cp /src/config.inc.php /www/phpmyadmin/

CMD ["sh", "/src/start.sh"]