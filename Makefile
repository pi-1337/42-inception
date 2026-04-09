DOCKER_COMPOSE_CLI = docker compose -f ./srcs/docker-compose.yml
SUDO = sudo

all: volumes
	@echo "[ RUNNING THE CONTAINERS ... ]"
	@$(SUDO) $(DOCKER_COMPOSE_CLI) up -d

volumes:
	@echo "[ CREATING VOLUMES DIRECTOIRES ... ]"
	@mkdir -p /home/ioulkhir/data/db
	@mkdir -p /home/ioulkhir/data/wp
	@echo "[ DONE ✅ ]"

stop:
	@echo "[ STOPPING THE CONTAINERS ... ]"
	@$(SUDO) $(DOCKER_COMPOSE_CLI) stop
	@echo "[ DONE ✅ ]"

clean:
	@echo "[ DELETING CONTAINERS ... ]"
	@$(SUDO) docker rm $($(SUDO) docker container ls -qa)
	@echo "[ DONE ✅ ]"

	@echo "[ DELETING IMAGES ... ]"
	@$(SUDO) docker rmi $($(SUDO) docker image ls -q)
	@echo "[ DONE ✅ ]"


fclean: clean
	@echo "[ DELETING VOLUMES ... ]"
	@$(SUDO) docker volume rm $($(SUDO) docker volume ls -q)
	@echo "[ DONE ✅ ]"


re: fclean all

