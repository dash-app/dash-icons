.DEFAULT_GOAL := help

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build components
	# Build Aircon...
	@mkdir -p ./src/aircon
	# Fan
	@mkdir -p ./src/aircon/fan
	@npx @svgr/cli --icon -d ./src/aircon/fan ./aircon/fan
	# Horizontal Vane
	@mkdir -p ./src/aircon/horizontal_vane
	@npx @svgr/cli --icon -d ./src/aircon/horizontal_vane ./aircon/horizontal_vane
	# Vertical Vane
	@mkdir -p ./src/aircon/vertical_vane
	@npx @svgr/cli --icon -d ./src/aircon/vertical_vane ./aircon/vertical_vane

clean: ## Clean components
	@rm -rfv ./src/aircon
