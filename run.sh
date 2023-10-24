#!/bin/bash

REPO=https://github.com/evandjefie/my-static-portfolio.git

echo "[0]: Clone app from repo and move Dockerfile in"
git clone $REPO app
mv Dockerfile app

echo "[1]: Build app"
docker-compose -f docker-compose.yml build

echo "[2]: Deploy app on docker-compose"
docker-compose -f docker-compose.yml up -d

# echo "[2-1]: Test if app is running"
# sleep 3
# curl localhost:8083 | grep "Evan DJEFIE"

# echo "[3]: Convert docker-compose file to manifest k8s"
# echo "Env var doesn't work with Kompose"
# docker-compose config > .docker-compose.yml && kompose convert -o k8s -f .docker-compose.yml

# echo "[3]: Push image to dockerhub"
# echo "[3-1]: Login to dockerhub"
# echo $DOCKERHUB_PWD | docker login -u $DOCKERHUB_USR --password-stdin
# echo "\n[3-2]: Tag and Push image to dockerhub"
# docker push ${ORGANIZATION_NAME}/${APP_NAME}:${APP_VERSION}

# echo "[3]: Run minikube from docker as device"
# minikube start device=docker

# echo "[3]: Convert docker-compose file to manifest k8s"
# minikube kubectl -- apply -f k8s/static-app-deployment.yaml

# echo "[3]: Convert docker-compose file to manifest k8s"
# minikube kubectl -- apply -f k8s/static-app-service.yaml

# echo "[3]: Convert docker-compose file to manifest k8s"
# minikube kubectl -- get all -A

# echo "[1]: Build app"
# docker-compose -f docker-compose.yml down
