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

echo "START vm.setup.mean-stack.sh"

npm install -g webpack webpack-dev-server karma-cli protractor rimraf eslint node-sass typescript
# Some packages still look for the sass binary... just symlink to node-sass.
# ln -s node-sass sass

cd "$HOME/app/cornerstone-ui"
npm install
cd src/app/
rm -fR config
mkdir config
cd config/
cp "$HOME/setup/sample.frontend.config.ts" ./frontend.config.ts
sed -i "s@CORNERSTONE_WEBSITE_URL@$CORNERSTONE_WEBSITE_URL@g" ./frontend.config.ts
sed -i "s@CORNERSTONE_WEBSITE_NAME@$CORNERSTONE_WEBSITE_NAME@g" ./frontend.config.ts

# cd ~/app/cornerstone-ui
# npm run ssr-build
# npm run ssr-start

echo "END vm.setup.mean-stack.sh"

source "$HOME/setup/deconfig.sh"