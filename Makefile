# vim:ft=make:noexpandtab:
.PHONY: test logstash
.DEFAULT_GOAL := help

test: logstash ## Run all tests

logstash: ## Run logstash tests
	scripts/logstash_tests.sh

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
