#!/bin/bash

# Start MariaDB service
service mariadb start

# Wait for MariaDB to be fully ready
sleep 5

# Run the SQL setup with a here-document
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# Graceful shutdown so the container can start cleanly
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

# Restart in foreground to keep container alive
exec mysqld_safe
