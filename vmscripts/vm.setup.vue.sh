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

echo "START vm.setup.vue.sh"

    npm install -g @vue/cli@3.6.3
    cd "$HOME/app/cornerstone-ui/"


echo "END vm.setup.vue.sh"

source "$HOME/setup/deconfig.sh"