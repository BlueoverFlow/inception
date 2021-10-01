#!/bin/bash

printf "\e[31mdo you wanna clean?[y/n]: \e[0m\n"
read ANSWER5
if [ "$ANSWER5" = "y" ]; then
	printf "\e[31mlisting all active and exited containers and images ======\e[0m\n"
	docker ps --all
    echo -e
	docker images --all
    echo -e

	printf "\e[31m====== Specify what container and what image to delete ======\e[0m\n"
	printf "\e[31mDocker ID\e[0m\n"
	read ANSWER4
	if [ "$ANSWER4" = "all" ]
	then
		docker rm --force $(docker ps -a -q)
		docker rmi $(docker images -a -q)
		printf "\e[31mdeleted:\e[0m\n"
	elif [ "$ANSWER4" = "skip" ]
	then
		echo -e
	else
		docker rm --force $ANSWER4
		printf "\e[31mdeleted:\e[0m\n"
		printf "\e[31mdImage ID\e[0m\n"
		read IMGID		docker rmi $IMGID
		printf "\e[31mdeleted:\e[0m\n"
	fi
fi
printf "\n\e[31m		======== DONE ========\e[0m\n"