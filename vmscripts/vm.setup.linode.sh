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

echo "START vm.setup.linode.sh"

sudo bash -c 'printf "$CORNERSTONE_WEBSITE_URL" > /etc/hostname'
sudo hostname -F /etc/hostname
ip=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
# echo "$ip    $ip hostname" >> /etc/hosts
sudo bash -c 'echo "$ip    $ip hostname" >> /etc/hosts'
sudo ln -sf /usr/share/zoneinfo/PST /etc/localtime

sudo apt-get install -y nginx

sudo rm /etc/nginx/sites-enabled/default
sudo cp "$HOME/setup/host.nginx.conf" "/etc/nginx/sites-available/$CORNERSTONE_WEBSITE_URL"
sudo sed -i "s@CORNERSTONE_WEBSITE_URL@$CORNERSTONE_WEBSITE_URL@g" "/etc/nginx/sites-available/$CORNERSTONE_WEBSITE_URL"
sudo ln -s "/etc/nginx/sites-available/$CORNERSTONE_WEBSITE_URL" "/etc/nginx/sites-enabled/"
sudo sed -i "s@# server_names_hash_bucket_size 64;@server_names_hash_bucket_size 64;@g" /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx

echo "END vm.setup.linode.sh"

source "$HOME/setup/deconfig.sh"