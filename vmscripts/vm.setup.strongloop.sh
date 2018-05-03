source ~/app/cornerstone-backend/setup/config.sh

cp ~/app/cornerstone-backend/setup/sample.authentication.js ~/app/cornerstone-backend/server/boot/authentication.js
sed -ir "s@CORNERSTONE_ADMIN_USER@$CORNERSTONE_ADMIN_USER@g" ~/app/cornerstone-backend/server/boot/authentication.js
sed -ir "s@CORNERSTONE_EMAIL@$CORNERSTONE_EMAIL@g" ~/app/cornerstone-backend/server/boot/authentication.js
sed -ir "s@CORNERSTONE_ADMIN_PASSWORD@$CORNERSTONE_ADMIN_PASSWORD@g" ~/app/cornerstone-backend/server/boot/authentication.js

cp ~/app/cornerstone-backend/setup/sample.backend.config.json ~/app/cornerstone-backend/server/backend.config.json
sed -ir "s@CORNERSTONE_WEBSITE_URL@$CORNERSTONE_WEBSITE_URL@g" ~/app/cornerstone-backend/server/backend.config.json
sed -ir "s@CORNERSTONE_WEBSITE_NAME@$CORNERSTONE_WEBSITE_NAME@g" ~/app/cornerstone-backend/server/backend.config.json
sed -ir "s@CORNERSTONE_EMAIL@$CORNERSTONE_EMAIL@g" ~/app/cornerstone-backend/server/backend.config.json
sed -ir "s@CORNERSTONE_TIMEZONE@$CORNERSTONE_TIMEZONE@g" ~/app/cornerstone-backend/server/backend.config.json

cp ~/app/cornerstone-backend/setup/sample.datasources.json ~/app/cornerstone-backend/server/datasources.json
sed -ir "s@CORNERSTONE_EMAIL_PASSWORD@$CORNERSTONE_EMAIL_PASSWORD@g" ~/app/cornerstone-backend/server/datasources.json
sed -ir "s@CORNERSTONE_EMAIL_PASSWORD@$CORNERSTONE_EMAIL_PASSWORD@g" ~/app/cornerstone-backend/server/datasources.json

source ~/app/cornerstone-backend/setup/deconfig.sh