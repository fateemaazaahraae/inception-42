FROM debian:bullseye

RUN apt-get -y update && \
    apt-get install -y redis-server && \
    echo "maxmemory 256mb" >> /etc/redis/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf && \
    sed -i -r "s/^bind .*/# bind removed for container access/" /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode", "no"]