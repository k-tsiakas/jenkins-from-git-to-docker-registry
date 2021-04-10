#!/bin/sh
# Step 1: delete network if exists / Βήμα 1: Διαγραφή δικτύου Docker εάν υπαρχει ήδη
dt=$(date '+%d-%m-%Y %H:%M:%S');
if (($(docker network ls | grep main_bridge_network > /dev/null)))
then
  echo "$dt: Network with name:main_bridge_network is about to be removed..."
  docker network rm main_bridge_network

else
  echo "$dt: Network with name:main_bridge_network does not exist."
fi
