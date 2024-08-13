FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Setup for ubuntu-server
RUN echo "tzdata tzdata/Areas select Asia" | debconf-set-selections && \
    echo "tzdata tzdata/Zones/Etc select UTC+7" | debconf-set-selections && \
    echo "postfix postfix/mailname string ubuntu-vps" | debconf-set-selections && \
    echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections


# Install necessary packages
RUN apt-get update

RUN apt-get install -y sudo nano-tiny curl wget vim-tiny dtach openssh-server iproute2 iputils-ping
RUN rm -rf /var/lib/apt/lists/*
# Configure SSH
RUN mkdir /var/run/sshd
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

EXPOSE 22

# Create start_script.sh for container runtime
RUN echo '#!/usr/bin/env bash' > /opt/start_script.sh
# Create user at runtime
RUN echo 'useradd $USER -ms /bin/bash  \
    && echo "$USER:$PASSWORD" | chpasswd  \
    && adduser $USER sudo \
    && mkdir /home/$USER \
    && chown $USER /home/$USER' >> /opt/start_script.sh
# Start ssh daemon
RUN echo '/usr/sbin/sshd -D' >> /opt/start_script.sh
# Remove password from ENV
RUN echo 'unset PASSWORD' >> /opt/start_script.sh

RUN chmod +x /opt/start_script.sh
ENV DEBIAN_FRONTEND=""

ENTRYPOINT [ "/opt/start_script.sh" ]
