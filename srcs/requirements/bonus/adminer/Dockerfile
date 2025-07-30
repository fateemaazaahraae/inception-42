FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php php-cli php-fpm \
    php-mysql php-mbstring \
    wget curl unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

RUN wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    chmod 644 index.php

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
