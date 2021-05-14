#!/bin/bash/

# minikube stop
# minikube delete
# minikube start --driver=virtualbox --addons dashboard --addons metallb
# minikube start --driver=virtualbox

# minikube addons disable metallb

# # if metallb doesn't work

# eval $(minikube docker-env)
# docker pull metallb/speaker:v0.8.2
# docker pull metallb/controller:v0.8.2
# minikube addons enable metallb

kubectl delete deploy --all
kubectl delete services --all
kubectl delete pods --all
eval $(minikube docker-env)
# docker login

docker build -t nginx_image ./srcs/nginx/
docker build -t wordpress_image ./srcs/wordpress/
docker build -t phpmyadmin_image ./srcs/phpmyadmin/
docker build -t mysql_image ./srcs/mysql/
docker build -t ftps_image ./srcs/ftps/
docker build -t grafana_image ./srcs/grafana/
docker build -t influxdb_image ./srcs/influxdb/
docker build -t telegraf_image ./srcs/telegraf/

kubectl apply -f ./srcs/yaml/metallb.yaml
kubectl apply -f ./srcs/yaml/nginx-deployment.yaml
kubectl apply -f ./srcs/yaml/wordpress-deployment.yaml
kubectl apply -f ./srcs/yaml/phpmyadmin-deployment.yaml
kubectl apply -f ./srcs/yaml/mysql-deployment.yaml
kubectl apply -f ./srcs/yaml/ftps-deployment.yaml
kubectl apply -f ./srcs/yaml/grafana-deployment.yaml
kubectl apply -f ./srcs/yaml/influxdb-deployment.yaml
kubectl apply -f ./srcs/yaml/telegraf-deployment.yaml

minikube dashboard