FROM coredns/coredns:1.11.3
COPY ./docker/config/Corefile /home/nonroot/Corefile
EXPOSE 53
