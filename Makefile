all:
	docker-compose -f srcs/docker-compose.yml up --build -d

stop:
	docker-compose -f srcs/docker-compose.yml down

vclean:
	docker-compose -f srcs/docker-compose.yml down
	rm -rf /home/tcosse/data/wordpress_data/* /home/tcosse/data/mariadb_data/*

allclean:
	docker-compose -f srcs/docker-compose.yml down
	sh erase.sh
	docker image prune -a
	rm -rf /home/tcosse/data/wordpress_data/* /home/tcosse/data/mariadb_data/*
