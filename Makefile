.PHONY: db
NAME=personal-jupyter

all: run

run:
	docker-compose -f docker-compose.yml -p ${NAME} up -d

c:
	docker-compose -f docker-compose.yml -p ${NAME} run --rm websocket /bin/bash

clean:
	docker-compose -f docker-compose.yml -p ${NAME} down || true
	docker-compose -f docker-compose.yml -p ${NAME} rm -f || true

ps:
	docker-compose -f docker-compose.yml -p ${NAME} ps

logs:
	docker-compose -f docker-compose.yml -p ${NAME} logs -f
