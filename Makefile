.PHONY: db
NAME=personal-jupyter

all: run

install:
	mkdir data || true
	chown -R ubuntu:ubuntu data
	docker run --name ${NAME} jupyter/datascience-notebook true
	docker cp ${NAME}:/home/jovyan data/jupyter
	docker rm ${NAME}
	chown -R ubuntu:ubuntu data

run:
	docker-compose -f docker-compose.yml -p ${NAME} up -d

c:
	docker-compose -f docker-compose.yml -p ${NAME} run --rm jupyter /bin/bash

clean:
	docker-compose -f docker-compose.yml -p ${NAME} down || true
	docker-compose -f docker-compose.yml -p ${NAME} rm -f || true

ps:
	docker-compose -f docker-compose.yml -p ${NAME} ps

logs:
	docker-compose -f docker-compose.yml -p ${NAME} logs -f
