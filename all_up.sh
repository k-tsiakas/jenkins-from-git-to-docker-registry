#!/bin/bash
docker rmi $(docker images -f "dangling=true" -q) #remove all none images
docker rm $(docker ps -a -f status=exited -q) #remove all exited containers

sh network/create_main_bridge_network.sh #create the network which hosts the services

docker-compose  -f docker-gui/docker-compose.yml up --build --remove-orphans -d #start registry
docker-compose  -f registry/docker-compose.yml   up --build --remove-orphans -d #start registry
docker-compose  -f jenkins/docker-compose.yml    up --build --remove-orphans -d #start jenkins
