#!/usr/bin/env bash
if [ "$ENV" == "production" ]; then
    echo "*** PRODUCTION MODE ***"
    su "$USER"
    export HOME="/home/$USER"
    THE_USER=`whoami`
    echo "USER is $THE_USER"
    echo "HOME path is $HOME"

fi
source "$HOME/setup/config.sh"

echo "START vm.setup.server.sh"

    sudo apt-get update
    sudo apt-get install -y build-essential screen
    sudo apt-get install -y software-properties-common

echo "END vm.setup.server.sh"

source "$HOME/setup/deconfig.sh"