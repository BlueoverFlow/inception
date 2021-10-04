NAME = inception
SRC = ./srcs/docker-compose.yml
all : ${NAME}

${NAME}:
	docker-compose -f ${SRC} up --build -d
re : fclean all
clean :
	docker-compose -f ${SRC} down
fclean :
	docker-compose -f ${SRC} down --rmi all
	docker volume rm 
