#!/bin/bash

# Create WordPress Directory
mkdir -p /var/www/wordpress
cd /var/www/wordpress

# Download and Install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Download WordPress Core
wp core download --allow-root

# Move the Sample Configuration File
mv wp-config-sample.php wp-config.php

echo "define('WP_REDIS_HOST', 'redis');" >> wp-config.php
echo "define('WP_REDIS_PORT', 6379);" >> wp-config.php
echo "define('WP_CACHE', true);" >> wp-config.php

# Configure the Database Connection
sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '${MYSQL_DATABASE}' );/" wp-config.php
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '${MYSQL_USER}' );/" wp-config.php
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '${MYSQL_PASSWORD}' );/" wp-config.php
sed -i "s/localhost/mariadb/" wp-config.php

# Wait for MariaDB to be ready
sleep 10

# Install WordPress
wp core install \
  --url="${DOMAIN_NAME}" \
  --title="${SITE_TITLE}" \
  --admin_user="${WP_ADMIN_USER}" \
  --admin_password="${WP_ADMIN_PASSWORD}" \
  --admin_email="${WP_ADMIN_EMAIL}" \
  --allow-root

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

# Create an Additional Editor User
wp user create \
    "${WP_USER}" "${WP_USER_EMAIL}" \
    --user_pass="${WP_USER_PASSWORD}" \
    --role=editor \
    --allow-root

# Prepare PHP-FPM Runtime Directory
mkdir -p /run/php

# Start PHP-FPM
php-fpm7.4 -F