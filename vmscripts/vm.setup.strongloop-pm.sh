sudo sl-pm-install --systemd #-set-env NODE_ENV=production
sudo systemctl start strong-pm
sudo cp /home/ubuntu/app/cornerstone-backend/setup/host.nginx.conf /etc/nginx/sites-available/local.cornerstone.com