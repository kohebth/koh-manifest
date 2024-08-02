#!/usr/bin/env bash
docker network rm vps-network
docker network create \
	--driver bridge \
	--subnet 172.28.0.0/16 \
	--gateway 172.28.0.1 \
	vps-network
