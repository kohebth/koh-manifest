FROM coredns/coredns:1.11.3
COPY ./configs/dns/Corefile /home/nonroot/Corefile
EXPOSE 53
