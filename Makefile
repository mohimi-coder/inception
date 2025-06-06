all:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose -f srcs/docker-compose.yml up --build -d

clean:
	docker compose -f srcs/docker-compose.yml down -v

fclean: clean
	docker system prune -af --volumes
	sudo rm -rf /home/mohimi/data/mariadb
	sudo rm -rf /home/mohimi/data/wordpress

re: fclean all