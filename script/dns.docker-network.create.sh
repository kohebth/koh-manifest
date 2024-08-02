#!/usr/bin/env bash
docker network rm dns-network
docker network create \
	--driver bridge \
	--subnet 10.5.0.0/24 \
	--gateway 10.5.0.1 \
	--ip-range 10.5.0.0/25 \
	dns-network
