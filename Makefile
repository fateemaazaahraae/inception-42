COMPOSE = docker-compose -f srcs/docker-compose.yml

# Volume names (as defined in docker-compose.yml)
VOLUMES = srcs_wordpress srcs_mariadb

# Data folders (if using bind mount)
DATA_DIRS = /home/fbazaz/data/wordpress /home/fbazaz/data/mariadb

all: 
	@echo "🔧 Building and 🚀 Starting containers..."
	@mkdir -p $(DATA_DIRS)
	$(COMPOSE) up

down:
	@echo "🛑 Stopping containers..."
	$(COMPOSE) down

clean: down
	@echo "🧹 Removing volumes..."
	@docker volume rm -f $(VOLUMES)

fclean: clean
	@echo "🗑  Deleting data directories (bind mount)..."
	@sudo rm -rf $(DATA_DIRS)

re: fclean all

.PHONY: all build up down clean fclean re
