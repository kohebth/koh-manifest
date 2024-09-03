#!/bin/bash
if [ ! -f /etc/openvpn/easy-rsa/pki/ca.crt ]; then
    echo "Generating OpenVPN keys..."

    # Initialize Easy-RSA
    ./easyrsa init-pki

    # Build the CA
    ./easyrsa build-ca nopass

    # Generate server certificate and key
    ./easyrsa build-server-full server nopass

    # Generate Diffie-Hellman parameters
    ./easyrsa gen-dh

    # Generate client certificate and key (for example: client1)
    ./easyrsa build-client-full client1 nopass

    # Copy the certificates and keys to the OpenVPN directory
    cp pki/ca.crt /etc/openvpn/
    cp pki/issued/server.crt /etc/openvpn/
    cp pki/private/server.key /etc/openvpn/
    cp pki/dh.pem /etc/openvpn/
    cp pki/issued/client1.crt /etc/openvpn/
    cp pki/private/client1.key /etc/openvpn/
fi
