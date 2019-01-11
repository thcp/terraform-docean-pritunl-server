#!/bin/bash

set -ex

#Download latest version from repository
mkdir -p /tmp/setup && cd $_
LATEST_RELEASE=$(curl -s https://api.github.com/repos/thcp/pritunl-compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -L "https://github.com/thcp/pritunl-compose/archive/${LATEST_RELEASE}.tar.gz" | tar xz

# Install
cd pritunl-compose*

PUBLIC_IP=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -f1 -d'/' | head -1)
PRIVATE_IP=$(ip addr show eth1 | grep "inet\b" | awk '{print $2}' | cut -f1 -d'/')

echo "PRIV_IP=$PRIVATE_IP" > .env
echo "PUB_IP=$PUBLIC_IP" >> .env

make build
make run