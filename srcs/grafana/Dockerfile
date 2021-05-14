FROM alpine:3.12

RUN apk update
RUN apk add openrc grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted

RUN mkdir -p /var/lib/grafana/dashboards/

COPY ./srcs/dashboards.json /var/lib/grafana/dashboards/
COPY ./srcs/datasourses.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY ./srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY ./srcs/start.sh ./
RUN chmod 755 start.sh

EXPOSE 3000

CMD ["sh", "start.sh"]