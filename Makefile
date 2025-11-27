ROUTE = ./srcs/docker-compose.yml

# Colores
GREEN = \033[0;32m
BLUE = \033[0;34m
YELLOW = \033[0;33m
NC = \033[0m# No Color (reset)

up:
	@docker compose -f $(ROUTE) up

down:
	@docker compose -f $(ROUTE) down

ls:
	@echo "$(GREEN)CONTAINERS$(NC)"
	@docker ps -a
	@echo "-----\n"

	@echo "$(BLUE)IMAGES$(NC)"
	@docker images -a
	@echo "-----\n"

	@echo "$(YELLOW)VOLUMES$(NC)"
	@docker volume ls

clean: down
	@docker system prune -af


# docker compose up
# 	- flag: --build
# docker compose down
# 	- flag: -v
# 
# docker rmi <imagen> -> borra imagenes
# docker rm <contenedor> -> borra contenedores
# 
# docker ps -> te muestra contenedores activos
# 	- flags: -a
# docker images -> te muestra imagenes creadas
# 	- flags: -a
# docker volume ls -> te muestra volumenes creados

