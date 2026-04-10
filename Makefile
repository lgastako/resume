help: ## Display this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

SHOW:=$(shell which bat || echo "cat")
show: ## Show the Makefile
	@$(SHOW) Makefile

aliases: ## Show the aliases
	@sed -n '/^# Aliases/,$$p' Makefile | sed -n '/^[a-zA-Z_-]\{1,\}: /p'

build:
	pandoc -V colorlinks=true -V linkcolor=blue README.md -o resume.pdf

# Aliases

a: aliases
b: build
s: show
