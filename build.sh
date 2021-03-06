#! /bin/bash

IMAGE=brasserie-de-toulbroch
TAG=broceliande
NAME=brasserie-de-toulbroch-broceliande

# mr proper
rm -f sdcard.img

# docker build
docker rmi $IMAGE:$TAG
mkdir -p dl
docker build -t $IMAGE:$TAG .

# retrieve rpi3 image
docker run -itd --name $NAME $IMAGE:$TAG

docker cp $NAME:/root/buildroot-2017.08/output/images/sdcard.img .
docker stop $NAME
docker rm $NAME
