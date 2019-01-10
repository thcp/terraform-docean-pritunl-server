#!/bin/bash

set -ex

#Download latest version from repository
mkdir -p /tmp/setup && cd $_
LATEST_RELEASE=$(curl -s https://api.github.com/repos/thcp/pritunl-compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
curl -L "https://github.com/thcp/pritunl-compose/archive/${LATEST_RELEASE}.tar.gz" | tar xz

# Install
cd pritunl-compose*
docker network create proxy
make build
make run