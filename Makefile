# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlandolt <rlandolt@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/08 10:50:25 by rlandolt          #+#    #+#              #
#    Updated: 2024/10/08 14:22:16 by rlandolt         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 
	docker compose -f docker-compose.yml up -d

down : 
	docker compose -f docker-compose.yml down

start : 
	docker compose -f docker-compose.yml start

stop : 
	docker compose -f docker-compose.yml stop

status : 
	docker ps

# sudo docker build -t nginx:42 .
# sudo docker run -it --rm -p 8080:80 -p 443:443 --name nginx nginx:42
# sudo sudo docker rmi nginx:42 
# sudo docker images
#sudo docker ps -a