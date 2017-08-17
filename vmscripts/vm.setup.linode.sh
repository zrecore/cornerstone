#!/bin/bash
source /home/ubuntu/app/cornerstone-backend/setup/config.sh

echo "$CORNERSTONE_WEBSITE_URL" > /etc/hostname
hostname -F /etc/hostname
ip=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
echo "$ip    $ip hostname" >> /etc/hosts
ln -sf /usr/share/zoneinfo/PST /etc/localtime

apt-get install -y nginx

rm /etc/nginx/sites-enabled/default
cp /home/ubuntu/app/cornerstone-backend/setup/host.nginx.conf "/etc/nginx/sites-available/$CORNERSTONE_WEBSITE_URL"
sed -i "s@CORNERSTONE_WEBSITE_URL@$CORNERSTONE_WEBSITE_URL@g" "/etc/nginx/sites-available/$CORNERSTONE_WEBSITE_URL"
ln -s "/etc/nginx/sites-available/$CORNERSTONE_WEBSITE_URL" "/etc/nginx/sites-enabled/"
sed -i "s@# server_names_hash_bucket_size 64;@server_names_hash_bucket_size 64;@g" /etc/nginx/nginx.conf
nginx -t
systemctl restart nginx

cd /home/ubuntu/app/cornerstone-ui
ng build --prod

source /home/ubuntu/app/cornerstone-backend/setup/deconfig.sh