#!/usr/bin/env bash
source "$HOME/setup/config.sh"
echo "START vm.setup.golang.sh"

# See https://github.com/golang/go/wiki/Ubuntu
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install -y golang-go

echo "END vm.setup.golang.sh"
source "$HOME/setup/deconfig.sh"