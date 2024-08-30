#!/usr/bin/env bash
docker network rm kafka-network
docker network create \
	--driver bridge \
	--subnet 172.86.31.0/24 \
	--gateway 172.86.31.1 \
	kafka-network
