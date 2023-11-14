# Makefile

IMAGE_NAME := comex_image
DOCKER_COMPOSE := docker-compose

.PHONY: build up down

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up

down:
	$(DOCKER_COMPOSE) down

# Adicione outras regras conforme necessário
