#!/usr/bin/env bash

set -e

function setup_docker() {
    echo "Installing compose..."
    curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
    chmod +x /usr/bin/docker-compose

    touch ~/.docker_installed
}

test -f ~/.docker_installed || setup_docker

cd /vagrant/test
docker-compose up -d
