# Loading .env if exists. This file can override the variables above.
ifneq (,$(wildcard ./.env))
    include .env
    export
endif

#############################
# DOCKER COMMANDS           #
#############################

.PHONY: start
start: 
	@echo "Start project"
	@echo "npm start"