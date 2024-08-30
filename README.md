# VPS Docker
A small dockerized node with DNS

Easy to configure for migrate and access to a VPS instant

## How to use?
Simply run 
```
bash setup.sh
```

Then, add the 10.5.0.5 to your host DNS configuration.

While you are using systemd-resolved (`sudo` is required)
```
DNS_ADDRESS=10.5.0.5
RESOLV_CONF=/etc/systemd/resolved.conf
(grep -q "^DNS=.*$DNS_ADDRESS" "$RESOLV_CONF") || (grep -q '^#DNS=' "$RESOLV_CONF" && sed -i "s/^#DNS=.*/DNS=$DNS_ADDRESS/" "$RESOLV_CONF") || (grep -q '^DNS=' "$RESOLV_CONF" && sed -i "/^DNS=/ s/$/ $DNS_ADDRESS/" "$RESOLV_CONF")
systemctl restart systemd-resolved.service
```

#### Docker networks will be created

```
vps-network
vs-network
mail-network
kafka-network
dns-network
```

#### A docker container named `sv-coredns` will be created

## How to customize it?

[*.docker-network.create.sh](./script/vps.docker-network.create.sh): Script creates network

[corends.Dockerfile](./docker/coredns.Dockerfile): Dockerfile `coredns` pre-build, current version is v1.11.3

[Corefile](./docker/config/Corefile): Configuration file for coredns v1.11.3

[docker-compose.yml](./docker-compose.yml): Docker compose file, change this accordingly

[setup.sh](./setup.sh): Simply cooked running step for you :)
