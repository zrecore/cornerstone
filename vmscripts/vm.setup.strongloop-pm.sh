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

echo "START vm.setup.strongloop-pm.sh"


sudo sl-pm-install --systemd #-set-env NODE_ENV=production
sudo systemctl start strong-pm
#sudo cp '~/app/cornerstone-backend/setup/host.nginx.conf' '/etc/nginx/sites-available/$CORNERSTONE_WEBSITE_URL'
#sudo sed -i 's@CORNERSTONE_WEBSITE_URL@$CORNERSTONE_WEBSITE_URL@g'

echo "END vm.setup.strongloop-pm.sh"

source "$HOME/setup/deconfig.sh"