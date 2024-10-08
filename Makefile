# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rlandolt <rlandolt@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/08 10:50:25 by rlandolt          #+#    #+#              #
#    Updated: 2024/10/08 11:28:47 by rlandolt         ###   ########.fr        #
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