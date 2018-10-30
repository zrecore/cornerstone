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

echo "START vm.setup.strongloop.sh"

cp "$HOME/app/cornerstone-backend/setup/sample.authentication.js" "$HOME/app/cornerstone-backend/server/boot/authentication.js"
sed -i "s@CORNERSTONE_ADMIN_USER@$CORNERSTONE_ADMIN_USER@g" "$HOME/app/cornerstone-backend/server/boot/authentication.js"
sed -i "s@CORNERSTONE_EMAIL@$CORNERSTONE_EMAIL@g" "$HOME/app/cornerstone-backend/server/boot/authentication.js"
sed -i "s@CORNERSTONE_ADMIN_PASSWORD@$CORNERSTONE_ADMIN_PASSWORD@g" "$HOME/app/cornerstone-backend/server/boot/authentication.js"

cp "$HOME/app/cornerstone-backend/setup/sample.backend.config.json" "$HOME/app/cornerstone-backend/server/backend.config.json"
sed -i "s@CORNERSTONE_WEBSITE_URL@$CORNERSTONE_WEBSITE_URL@g" "$HOME/app/cornerstone-backend/server/backend.config.json"
sed -i "s@CORNERSTONE_WEBSITE_NAME@$CORNERSTONE_WEBSITE_NAME@g" "$HOME/app/cornerstone-backend/server/backend.config.json"
sed -i "s@CORNERSTONE_EMAIL@$CORNERSTONE_EMAIL@g" "$HOME/app/cornerstone-backend/server/backend.config.json"
sed -i "s@CORNERSTONE_TIMEZONE@$CORNERSTONE_TIMEZONE@g" "$HOME/app/cornerstone-backend/server/backend.config.json"

cp "$HOME/app/cornerstone-backend/setup/sample.datasources.json" "$HOME/app/cornerstone-backend/server/datasources.json"
sed -i "s@CORNERSTONE_EMAIL@$CORNERSTONE_EMAIL@g" "$HOME/app/cornerstone-backend/server/datasources.json"
sed -i "s@CORNERSTONE_EMAIL_PASSWORD@$CORNERSTONE_EMAIL_PASSWORD@g" "$HOME/app/cornerstone-backend/server/datasources.json"

echo "END vm.setup.strongloop.sh"

source "$HOME/setup/deconfig.sh"