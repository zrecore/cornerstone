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

echo "START vm.setup.node.sh"

export NVM_DIR="$HOME/.nvm"
mkdir -p "$HOME/.nvm/"
touch "$HOME/.profile"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

source "$HOME/.bashrc"
echo "source $HOME/.nvm/nvm.sh" >> "$HOME/.profile"
source "$HOME/.nvm/nvm.sh"
nvm install v10.9.0
nvm use --delete-prefix v10.9.0 --silent

echo "END vm.setup.node.sh"

source "$HOME/setup/deconfig.sh"