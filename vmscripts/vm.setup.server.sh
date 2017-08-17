source /home/ubuntu/app/cornerstone-backend/setup/config.sh

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
    apt-get update
    cd /home/ubuntu
    curl -sL https://deb.nodesource.com/setup_7.x -o nodesource_setup.sh
    bash nodesource_setup.sh
    rm -f nodesource_setup.sh
    chown -R ubuntu:ubuntu /usr/local
    apt-get install -y build-essential python2.7 screen
    ln -s /usr/bin/python2.7 /usr/bin/python
    export PYTHON=/usr/bin/python2.7
    apt-get install -y nodejs mongodb-org software-properties-common
    echo "[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target" | tee /etc/systemd/system/mongodb.service
    sudo systemctl start mongodb
    sudo systemctl enable mongodb
    cd /home/ubuntu/app/cornerstone-backend/setup/
    mongo admin --eval "var MONGODB_USER='$MONGODB_USER', MONGODB_PASSWORD='$MONGODB_PASSWORD'" users.mongo.js
    sudo sed -i 's@ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf@ExecStart=/usr/bin/mongod --quiet --auth --config /etc/mongod.conf@g' /lib/systemd/system/mongod.service
    sudo systemctl daemon-reload
    sudo systemctl restart mongodb

source /home/ubuntu/app/cornerstone-backend/setup/deconfig.sh