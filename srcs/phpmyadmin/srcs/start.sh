#!/bin/sh

rc default

mkdir -p /run/nginx

chmod 755 /run/nginx

/usr/bin/supervisord -c /etc/supervisord.conf

nginx -g "daemon off;"