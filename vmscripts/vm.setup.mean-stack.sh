source ~/app/cornerstone-backend/setup/config.sh

npm config set python /usr/bin/python2.7
npm config set prefix /usr/local
npm install -g @angular/cli strongloop loopback-cli strong-pm webpack webpack-dev-server karma-cli protractor typescript rimraf
cd ~/app/cornerstone-frontend
npm install
cd src/app/
rm -fR config
mkdir config
cd config/
cp ~/app/cornerstone-backend/setup/frontend.config.json ./frontend.config.json
sed -i "s@CORNERSTONE_WEBSITE_URL@$CORNERSTONE_WEBSITE_URL@g" ./frontend.config.json
sed -i "s@CORNERSTONE_WEBSITE_NAME@$CORNERSTONE_WEBSITE_NAME@g" ./frontend.config.json

# cd ~/app/cornerstone-frontend
# npm run ssr-build
# npm run ssr-start

source ~/app/cornerstone-backend/setup/deconfig.sh