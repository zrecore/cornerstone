source ~/app/cornerstone-backend/setup/config.sh

sudo sl-pm-install --systemd #-set-env NODE_ENV=production
sudo systemctl start strong-pm
#sudo cp '~/app/cornerstone-backend/setup/host.nginx.conf' '/etc/nginx/sites-available/$CORNERSTONE_WEBSITE_URL'
#sudo sed -i 's@CORNERSTONE_WEBSITE_URL@$CORNERSTONE_WEBSITE_URL@g'

source ~/app/cornerstone-backend/setup/deconfig.sh