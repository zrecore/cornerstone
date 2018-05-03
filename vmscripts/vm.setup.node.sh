source ~/app/cornerstone-backend/setup/config.sh

export NVM_DIR="$HOME/.nvm"
touch ~/.profile

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

source ~/.bashrc
echo "source ~/.nvm/nvm.sh" >> ~/.profile
source ~/.nvm/nvm.sh
nvm install node
nvm use --delete-prefix v10.0.0 --silent
nvm use node

source ~/app/cornerstone-backend/setup/deconfig.sh