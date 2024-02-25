GREEN	= \e[92m
RESET	= \e[0m

COMPOSE	= docker-compose.yml

all: build

build:
	@echo "$(GREEN)** Building containers **$(RESET)"
	@docker-compose --file=$(COMPOSE) up --build -d

down:
	@echo "$(GREEN)** Down containers **$(RESET)"
	@docker-compose --file=$(COMPOSE) down

start:
	@echo "$(GREEN)** Start containers ** $(RESET)"
	@docker-compose --file=$(COMPOSE) start

stop:
	@echo "$(GREEN)** Stop containers ** $(RESET)"
	@docker-compose --file=$(COMPOSE) stop

list:
	@echo "$(GREEN)** List containers **$(RESET)"
	@docker-compose -f $(COMPOSE) ps

fclean:
		@echo "$(GREEN) ** Remove all containers ** $(RESET)"
		@docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null