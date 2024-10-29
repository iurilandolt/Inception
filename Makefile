# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlandolt <rlandolt@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/08 10:50:25 by rlandolt          #+#    #+#              #
#    Updated: 2024/10/25 15:23:15 by rlandolt         ###   ########.fr        #
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
	docker rmi nginx:42 wordpress:42 mariadb:42 redis:42 vsftp:42 adminer:42 netdata:42 nodejs:42
	docker volume rm srcs_db_data srcs_wp_data
	sudo rm -rf ~/data


status : 
	docker ps
