FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add openrc influxdb

EXPOSE 8086

CMD influxd