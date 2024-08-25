#!/usr/bin/env bash
docker network rm mail-network
docker network create \
	--driver bridge \
	--subnet 172.21.252.0/26 \
	--gateway 172.21.252.1 \
	--ip-range 172.21.252.0/26 \
	mail-network
