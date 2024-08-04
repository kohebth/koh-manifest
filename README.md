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
#### Two docker networks will be created

##### vps-network
``` 
Subnet: 172.28.0.0/16
Gateway: 172.28.0.1
IP Range: 172.28.0.0/16
```

##### dns-network
``` 
Subnet: 10.5.0.0/24
Gateway: 10.5.0.1
IP Range: 10.5.0.0/25
```

#### A docker container named `sv-coredns` will be created

## How to customize it?

[vps.docker-network.create.sh](./script/vps.docker-network.create.sh): Script creates network `vps-network`

[dns.docker-network.create.sh](./script/dns.docker-network.create.sh): Script creates network `dns-network`

[corends.Dockerfile](./docker/coredns.Dockerfile): Dockerfile `coredns` pre-build, current version is v1.11.3

[Corefile](./docker/config/Corefile): Configuration file for coredns v1.11.3

[docker-compose.yml](./docker-compose.yml): Docker compose file, change this accordingly

[setup.sh](./setup.sh): Simply cooked running step for you :)
