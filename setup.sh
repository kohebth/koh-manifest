#!/usr/bin/env bash

docker compose down

# Remove unused resource
./script/sv-coredns.docker-container.remove.sh sv-coredns
./script/dns.docker-network.create.sh
./script/vps.docker-network.create.sh

docker compose up --build
