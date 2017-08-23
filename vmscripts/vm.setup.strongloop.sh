source /home/ubuntu/app/cornerstone-backend/setup/config.sh

cp /home/ubuntu/app/cornerstone-backend/setup/sample.authentication.js /home/ubuntu/app/cornerstone-backend/server/boot/authentication.js
sed -ir "s@CORNERSTONE_ADMIN_USER@$CORNERSTONE_ADMIN_USER@g" /home/ubuntu/app/cornerstone-backend/server/boot/authentication.js
sed -ir "s@CORNERSTONE_EMAIL@$CORNERSTONE_EMAIL@g" /home/ubuntu/app/cornerstone-backend/server/boot/authentication.js
sed -ir "s@CORNERSTONE_ADMIN_PASSWORD@$CORNERSTONE_ADMIN_PASSWORD@g" /home/ubuntu/app/cornerstone-backend/server/boot/authentication.js

cp /home/ubuntu/app/cornerstone-backend/setup/sample.backend.config.json /home/ubuntu/app/cornerstone-backend/server/backend.config.json
sed -ir "s@CORNERSTONE_WEBSITE_URL@$CORNERSTONE_WEBSITE_URL@g" /home/ubuntu/app/cornerstone-backend/server/backend.config.json
sed -ir "s@CORNERSTONE_WEBSITE_NAME@$CORNERSTONE_WEBSITE_NAME@g" /home/ubuntu/app/cornerstone-backend/server/backend.config.json
sed -ir "s@CORNERSTONE_EMAIL@$CORNERSTONE_EMAIL@g" /home/ubuntu/app/cornerstone-backend/server/backend.config.json
sed -ir "s@CORNERSTONE_TIMEZONE@$CORNERSTONE_TIMEZONE@g" /home/ubuntu/app/cornerstone-backend/server/backend.config.json

cp /home/ubuntu/app/cornerstone-backend/setup/sample.datasources.json /home/ubuntu/app/cornerstone-backend/server/datasources.json
sed -ir "s@CORNERSTONE_EMAIL_PASSWORD@$CORNERSTONE_EMAIL_PASSWORD@g" /home/ubuntu/app/cornerstone-backend/server/datasources.json
sed -ir "s@CORNERSTONE_EMAIL_PASSWORD@$CORNERSTONE_EMAIL_PASSWORD@g" /home/ubuntu/app/cornerstone-backend/server/datasources.json

source /home/ubuntu/app/cornerstone-backend/setup/deconfig.sh