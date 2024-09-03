# Use Alpine Linux as the base image
FROM debian:11-slim

# Install OpenVPN and necessary utilities
RUN apt update && apt install openvpn easy-rsa nftables -y

# Expose OpenVPN port
EXPOSE 1194/udp

# Enable port forwarding
RUN echo 'net.ipv4.ip_forward = 1' >> /etc/sysctl.conf

COPY configs/vpn/nftables.conf /etc/nftables.conf 
RUN modprobe nf_nat
RUN nft -f /etc/nftables.conf

# Copy the entrypoint script
COPY configs/vpn/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
#ENTRYPOINT ["/bin/sh"]
