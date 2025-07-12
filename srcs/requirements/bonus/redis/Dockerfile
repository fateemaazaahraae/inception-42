FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y redis-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["redis-server", "--protected-mode", "no", "--bind", "0.0.0.0"]