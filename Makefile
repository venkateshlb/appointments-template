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
	# Commands for generating Template:
	# 
	# Generate all CRUD Template 
	# 	$$ make template NAME="#" CRUD="all"
	#
	# Generate create Template 
	# 	$$ make template NAME="#" CRUD="create"
	#
	# Generate update Template 
	# 	$$ make template NAME="#" CRUD="update"
	#
	# Generate delete Template 
	# 	$$ make template NAME="#" CRUD="delete"
	#
	# Generate get Template 
	# 	$$ make template NAME="#" CRUD="get"
	#	
	### Targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: template
template: intitate ## Create a template as a package (Lambda, Service and a Handler)
	@echo "--- Hello, Welcome to Template Generator ---"
	sh process.sh $(NAME) $(CRUD)
	@echo "Template Generation Successfull..."

intitate: 
ifeq ($(NAME),)
	@echo "[Error] Please specify a Template NAME"
	@exit 1;
endif

ifeq ($(CRUD),)
	@echo "[Error] Please specify a CRUD Operation to perform. Valid Inputs- all/create/update/delete/get"
	@exit 1;
endif

.PHONY: lambda
lambda: ## Create a Lambda template
	sh lambda.sh
	@echo "Lambda Template Generation Successfull..."