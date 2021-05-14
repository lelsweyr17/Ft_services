FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add openrc && \
	apk add mysql && \
	apk add mysql-client

RUN mkdir /run/mysqld
RUN chown -R mysql /run/mysqld

COPY srcs/lelsweyr.sql lelsweyr.sql
COPY srcs/start.sh start.sh
COPY srcs/my.cnf /etc/my.cnf
COPY srcs/mysql_conf.sql mysql_conf.sql

EXPOSE 3306

CMD	sh start.sh