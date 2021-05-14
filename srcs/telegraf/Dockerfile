FROM alpine:3.12

RUN apk update && apk upgrade

RUN wget -P /tmp/ https://dl.influxdata.com/telegraf/releases/telegraf-1.17.3_linux_amd64.tar.gz
RUN tar -xvf /tmp/telegraf-1.17.3_linux_amd64.tar.gz -C /tmp/
RUN rm -rf /tmp/telegraf-1.17.3_linux_amd64.tar.gz
RUN	mv /tmp/telegraf-1.17.3 /telegraf && cp -r telegraf/* ./ && rm -rf /telegraf

RUN	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN	apk add glibc-2.28-r0.apk --allow-untrusted

RUN telegraf -sample-config telegraf.conf --input-filter cpu:mem --output-filter influxdb > telegraf.conf
COPY ./srcs/telegraf.conf /etc/telegraf/

CMD telegraf