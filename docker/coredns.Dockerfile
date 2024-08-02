FROM coredns/coredns:latest
COPY ./docker/config/Corefile /home/nonroot/Corefile
