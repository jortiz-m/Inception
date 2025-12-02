ROUTE = ./srcs/docker-compose.yml

# Colores
GREEN = \033[0;32m
BLUE = \033[0;34m
YELLOW = \033[0;33m
NC = \033[0m# No Color (reset)

up:
	@mkdir -p /home/jortiz-m/data/mariadb
	@mkdir -p /home/jortiz-m/data/wordpress
	@chmod 777 /home/jortiz-m/data/mariadb
	@chmod 777 /home/jortiz-m/data/wordpress
	@docker compose -f $(ROUTE) up

down:
	@docker compose -f $(ROUTE) down
	@echo "Containers are stop."

clean: down
	@docker system prune -af
	@echo "Only images deleted."

fclean: down
	@docker system prune -af
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@rm -rf /home/jortiz-m/data
	@echo "All is cleaned!"

ls:
	@echo "$(GREEN)CONTAINERS$(NC)"
	@docker ps -a
	@echo "-----\n"

	@echo "$(BLUE)IMAGES$(NC)"
	@docker images -a
	@echo "-----\n"

	@echo "$(YELLOW)VOLUMES$(NC)"
	@docker volume ls


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

