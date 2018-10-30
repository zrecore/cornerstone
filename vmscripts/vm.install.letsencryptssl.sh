#!/usr/bin/env bash

echo "START vm.install.letsencryptssl.sh"

sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y certbot

echo "END vm.install.letsencryptssl.sh"