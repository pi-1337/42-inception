DOCKER_COMPOSE_CLI = docker compose -f ./srcs/docker-compose.yml

IMAGES=nginx:jesus wordpress:jesus mariadb:jesus
VOLUMES=srcs_wp srcs_db

all: volumes
	@echo "[ RUNNING THE CONTAINERS ... ]"
	@$(DOCKER_COMPOSE_CLI) up -d

volumes:
	@echo "[ CREATING VOLUMES DIRECTOIRES ... ]"
	@mkdir -p /home/ioulkhir/data/db
	@mkdir -p /home/ioulkhir/data/wp
	@echo "[ DONE ✅ ]"

start:
	@echo "[ STARTING THE CONTAINERS ... ]"
	@$(DOCKER_COMPOSE_CLI) start
	@echo "[ DONE ✅ ]"

stop:
	@echo "[ STOPPING THE CONTAINERS ... ]"
	@$(DOCKER_COMPOSE_CLI) stop
	@echo "[ DONE ✅ ]"

clean:
	@echo "[ DELETING CONTAINERS and NETWORKS ... ]"
	@$(DOCKER_COMPOSE_CLI) down
	@echo "[ DONE ✅ ]"


fclean: clean
	@echo "[ DELETING IMAGES ... ]"
	@docker rmi $(IMAGES) -f
	@echo "[ DELETING USELESS VOLUMES ... ]"
	@docker volume rm $(VOLUMES) -f
	@rm -fr /home/ioulkhir/data/db
	@rm -fr /home/ioulkhir/data/wp
	@echo "[ DONE ✅ ]"

rebuild:
	@echo "[ RUNNING THE CONTAINERS ... ]"
	@$(DOCKER_COMPOSE_CLI) up --build -d

re: fclean all

