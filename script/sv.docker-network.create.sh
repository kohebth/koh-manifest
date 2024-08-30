#!/usr/bin/env bash
docker network rm sv-network
docker network create \
	--driver bridge \
	--subnet 172.111.0.0/24 \
	--gateway 172.111.0.1 \
	--ip-range 172.111.0.0/24 \
	sv-network
