#!/usr/bin/env bash

cp develop.env .env

docker compose -f docker-compose.yml down

# Remove unused resource
./script/docker-container-remove.sh sv-coredns
./script/docker-container-remove.sh sv-database
./script/docker-container-remove.sh sv-mailserver
./script/docker-container-remote.sh sv-kafkacluster1
./script/docker-container-remote.sh sv-zoo

# create required network
./script/dns.docker-network.create.sh
./script/vps.docker-network.create.sh
./script/mail.docker-network.create.sh

docker compose -f docker-compose.yml up --build -d
