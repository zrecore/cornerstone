source ~/app/cornerstone-backend/setup/config.sh

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
    # echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
    sudo bash -c 'printf "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list'
    sudo apt-get update
    cd ~
    sudo apt-get install -y build-essential python2.7 screen
    sudo ln -s /usr/bin/python2.7 /usr/bin/python
    export PYTHON=/usr/bin/python2.7
    sudo apt-get install -y software-properties-common
    # sudo apt-get install -y mongodb-org
#     echo "[Unit]
# Description=High-performance, schema-free document-oriented database
# After=network.target

# [Service]
# User=mongodb
# ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

# [Install]
# WantedBy=multi-user.target" | tee /etc/systemd/system/mongodb.service

#     sudo bash -c '"[Unit]
# Description=High-performance, schema-free document-oriented database
# After=network.target

# [Service]
# User=mongodb
# ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

# [Install]
# WantedBy=multi-user.target" | tee /etc/systemd/system/mongodb.service'
#     sudo systemctl start mongodb
#     sudo systemctl enable mongodb
#     cd ~/app/cornerstone-backend/setup/
#     mongo admin --eval "var MONGODB_USER='$MONGODB_USER', MONGODB_PASSWORD='$MONGODB_PASSWORD'" users.mongo.js
#     sudo sed -i 's@ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf@ExecStart=/usr/bin/mongod --quiet --auth --config /etc/mongod.conf@g' /lib/systemd/system/mongod.service
#     sudo systemctl daemon-reload
#     sudo systemctl restart mongodb

source ~/app/cornerstone-backend/setup/deconfig.sh