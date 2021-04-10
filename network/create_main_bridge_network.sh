#!/bin/sh
# Step 1: create network if does not exist

dt=$(date '+%d-%m-%Y %H:%M:%S');

if (($(docker network ls | grep main_bridge_network > /dev/null)))
then
  echo "$dt: Network with name:main_bridge_network already exists..."
else
  docker network create            \
    --driver=bridge                \
    --subnet=172.28.0.0/16 		     \
    --ip-range=172.28.5.0/24	     \
    --gateway=172.28.5.254		     \
    main_bridge_network
  echo "$dt: Network with name:main_bridge_network successfully created!"
fi
