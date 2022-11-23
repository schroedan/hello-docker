export

# VARIABLES
.DEFAULT_GOAL := help
COMPOSE_FILE ?= compose-dev.yaml
COMPOSE_PROJECT_NAME ?= hello-docker
MAKEFILE := $(firstword $(MAKEFILE_LIST))
# END OF VARIABLES

.PHONY: help
help: ## Display help
	@printf "Hello Docker Makefile\n\n\033[33mUsage:\033[0m\n  make [target]\n\n\033[33mTargets:\033[0m\n"
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z_-]+:.*?## / {printf "  \033[32m%-7s\033[0m %s\n", $$1, $$2}' $(MAKEFILE)

.PHONY: pull
pull: ## Pull latest images
	@docker compose pull --ignore-pull-failures

.PHONY: build
build: ## Build local images
	@docker compose build

.PHONY: start
start: ## Start all containers
	@docker compose up --detach --remove-orphans

.PHONY: stop
stop: ## Stop all containers
	@docker compose down --remove-orphans

.PHONY: logs
logs: ## Follow output of container logs
	@docker compose logs --follow

.PHONY: status
status: ## List status of all containers
	@docker compose ps --all

.PHONY: shell
shell: ## Execute interactive shell in app container
	@docker compose exec app sh
