#!/usr/bin/env bash

cp develop.env .env

docker compose -f docker-compose.yml down

# Remove unused resource
./script/docker-container-remove.sh sv-coredns
./script/docker-container-remove.sh sv-database
./script/docker-container-remove.sh sv-mailserver
./script/docker-container-remove.sh sv-kafkacluster1
./script/docker-container-remove.sh sv-zoo

docker compose -f docker-compose.yml up --build -d
