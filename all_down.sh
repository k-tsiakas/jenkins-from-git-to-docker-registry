#!/bin/bash
docker-compose  -f jenkins/docker-compose.yml down
docker-compose  -f registry/docker-compose.yml down
docker-compose  -f docker-gui/docker-compose.yml down
