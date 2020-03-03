DEFAULT_GOAL := explain
.PHONY: explain
explain:
	### Welcome		
	#    
	#    /_\  _ __ _ __  ___(_)_ _| |_ _ __  ___ _ _| |_ ___
	#   / _ \| '_ \ '_ \/ _ \ | ' \  _| '  \/ -_) ' \  _(_-<
	#  /_/ \_\ .__/ .__/\___/_|_||_\__|_|_|_\___|_||_\__/__/
	#        |_|  |_|                                       
	#   _____               _      _       
	#  |_   _|__ _ __  _ __| |__ _| |_ ___ 
	#    | |/ -_) '  \| '_ \ / _` |  _/ -_)
	#    |_|\___|_|_|_| .__/_\__,_|\__\___|
	#                 |_|                  
		
					
	#
	### Basically, you can create an appointment template by running this command
	#
	# $$ make template - Create a template as a package (Lambda, Service and a Handler)
	# $$ make lambda   - Create a lambda template
	#
	### Targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: template
template: ## Create a template
	sh process.sh

.PHONY: lambda
lambda: ## Create a Lambda template
	sh lambda.sh