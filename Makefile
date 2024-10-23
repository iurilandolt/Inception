# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlandolt <rlandolt@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/08 10:50:25 by rlandolt          #+#    #+#              #
#    Updated: 2024/10/23 16:35:45 by rlandolt         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 
	mkdir -p ~/data
	mkdir -p ~/data/wp
	mkdir -p ~/data/db
#	mkdir -p secrets
#	touch secrets/dbname.txt secrets/dbpsw.txt secrets/dbusr.txt secrets/dbusrpsw.txt secrets/dbhost.txt secrets/wpmngr.txt secrets/wpusr.txt secrets/wpusrpsw.txt secrets/apikey.txt
	docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	docker-compose -f ./srcs/docker-compose.yml down

start : 
	docker-compose -f ./srcs/docker-compose.yml start

stop : 
	docker-compose -f ./srcs/docker-compose.yml stop

fclean : 
	docker-compose -f ./srcs/docker-compose.yml down
	docker rmi nginx:42 wordpress:42 mariadb:42 redis:42 vsftp:42 adminer:42 netdata:42
	docker volume rm srcs_db_data srcs_wp_data
	sudo rm -rf ~/data

status : 
	docker ps

# sudo docker build -t nginx:42 .
# sudo docker run -it --rm -p 8080:80 -p 443:443 --name nginx nginx:42
# sudo docker rmi nginx:42 
# sudo docker images
# sudo docker ps -a
# sudo docker compose -f docker-compose.yml up -d 
# sudo docker compose -f docker-compose.yml down
# sudo docker exec -it mariadb mysql -u maria -p 
# sudo docker run -it --rm --env-file ../../var.env -p 3306:3306 --name mariadb mariadb:42

# Use USE database_name; to select the database.
# Use SHOW TABLES; to list all tables in the selected database.
# Use DESCRIBE table_name; or SHOW COLUMNS FROM table_name; to see the structure of a table.
# Use SELECT * FROM table_name; to view all entries in a table.
# Feel free to replace table_name with the actual name of the table you want to explore.### Summary

# Use USE database_name; to select the database.
# Use SHOW TABLES; to list all tables in the selected database.
# Use DESCRIBE table_name; or SHOW COLUMNS FROM table_name; to see the structure of a table.
# Use SELECT * FROM table_name; to view all entries in a table