# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lelsweyr <lelsweyr@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 12:21:37 by lelsweyr          #+#    #+#              #
#    Updated: 2021/03/29 14:48:52 by lelsweyr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl

COPY ./srcs ./src

RUN cp /src/nginx.conf /etc/nginx/conf.d/default.conf
RUN cp /src/index.nginx.html /var/www/nginx.html

RUN mkdir /run/nginx/

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/ssl/private/my_cert.crt -keyout /etc/ssl/certs/my_key.key \ 
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21School/OU=lelsweyr/CN=nginx"

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]