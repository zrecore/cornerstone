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

echo "START vm.setup.letsencryptssl.sh"

sudo certbot certonly --standalone --email "$CORNERSTONE_EMAIL" --agree-tos --webroot-path="/home/$USER/app/cornerstone-ui/dist/" -d "$CORNERSTONE_URL" -d "www.$CORNERSTONE_URL"
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

# See https://stackoverflow.com/questions/29382385/how-do-i-set-up-a-vagrant-box-to-always-have-a-cron-job
cron='15 3 * * * /usr/bin/certbot renew --quiet --renew-hook "/bin/systemctl reload nginx"'
cron_escaped=$(echo "$cron" | sed s/\*/\\\\*/g)

crontab -l | grep "${cron_escaped}"
if [[ $? -eq 0 ]] ;
    then
        echo "Crontab already exists. Exiting..."
        exit
    else
        crontab -l > mycron
        echo "$cron" >> mycron
        crontab mycron
        rm mycron
fi

echo "END vm.setup.letsencryptssl.sh"

source "$HOME/setup/deconfig.sh"