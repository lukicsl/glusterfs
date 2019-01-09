#Inspired from : https://github.com/littlemanco/boilr-makefile/blob/master/template/Makefile, https://github.com/geetarista/go-boilerplate/blob/master/Makefile, https://github.com/nascii/go-boilerplate/blob/master/GNUmakefile https://github.com/cloudflare/hellogopher/blob/master/Makefile

APP_NAME=glusterfs
APP_VERSION=$(shell git describe --tags --abbrev=0)
APP_USERREPO=github.com/lukicsl
APP_PACKAGE=$(APP_USERREPO)/$(APP_NAME)

PLUGIN_USER ?= lukics
PLUGIN_NAME_SRV ?= glusterfs
PLUGIN_NAME_CLI ?= glustercl
PLUGIN_TAG ?= armv7
PLUGIN_IMAGE_SRV ?= $(PLUGIN_USER)/$(PLUGIN_NAME_SRV):$(PLUGIN_TAG)
PLUGIN_IMAGE_CLI ?= $(PLUGIN_USER)/$(PLUGIN_NAME_CLI):$(PLUGIN_TAG)
DOCKERFILE_SRV ?= 
DOCKERFILE_CLI ?= 
ERROR_COLOR=\033[31;01m
NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
WARN_COLOR=\033[33;01m

all: docker-image-srv docker-image-push-srv docker-image-cli docker-image-push-cli

docker-image-srv:
	@echo -e "$(OK_COLOR)==> Docker build image : ${PLUGIN_IMAGE_SRV} $(NO_COLOR)"
	docker build -t ${PLUGIN_IMAGE_SRV} .

docker-image-push-srv:
	@echo -e "$(OK_COLOR)==> push plugin : ${PLUGIN_IMAGE_SRV}$(NO_COLOR)"
	docker push ${PLUGIN_IMAGE_SRV}
	
docker-image-cli:
	@echo -e "$(OK_COLOR)==> Docker build image : ${PLUGIN_IMAGE_CLI} $(NO_COLOR)"
	docker build -t ${PLUGIN_IMAGE_CLI} .

docker-image-push-cli:
	@echo -e "$(OK_COLOR)==> push plugin : ${PLUGIN_IMAGE_CLI}$(NO_COLOR)"
	docker push ${PLUGIN_IMAGE_CLI}


