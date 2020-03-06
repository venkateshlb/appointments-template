#!/usr/bin/env bash
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Cyan='\033[0;36m'         # Cyan

# echo "$Cyan----- Hello, Welcome to Template Generator ----- $Color_Off"
# read -p "Enter the Template name: "  templateName
# read -p "Red* Type all for whole CRUD templates or
# * Type create for Create template
# * Type update for Update template
# * Type delete for Delete template
# * Type get for Get template: "  inputType

templateName=$1
inputType=$2

capitalizeTemplate="$(tr '[:lower:]' '[:upper:]' <<< ${templateName:0:1})${templateName:1}"
capitalizeInputType="$(tr '[:lower:]' '[:upper:]' <<< ${inputType:0:1})${inputType:1}"

writePackages() {
    getParam=$1
    capitalizeParam="$(tr '[:lower:]' '[:upper:]' <<< ${getParam:0:1})${getParam:1}"

    mkdir ./$templateName/$getParam-$templateName/lambda
    mkdir ./$templateName/$getParam-$templateName/handler
    mkdir ./$templateName/$getParam-$templateName/service

    ## Lambda
    sed 's/'$getParam'/'$capitalizeParam$capitalizeTemplate'/g' assets/template/$getParam-session/lambda.go > $templateName/$getParam-$templateName/lambda/lambda.go

    # Handler
    sed 's/CreateHand/'$capitalizeParam$capitalizeTemplate'/g' assets/template/handler/handler.go > $templateName/$getParam-$templateName/handler/handler.go

    # Service
    sed 's/CreateServ/'$capitalizeParam$capitalizeTemplate'/g' assets/template/service/service.go > $templateName/$getParam-$templateName/service/service.go
}

createAllTemplate() {
    mkdir ./$templateName
    mkdir ./$templateName/"create-$templateName"
    mkdir ./$templateName/"update-$templateName"
    mkdir ./$templateName/"delete-$templateName"
    mkdir ./$templateName/"get-$templateName"

    ## Create
    writePackages create

    ## Update
    writePackages update

    ## Delete
    writePackages delete

    ## Get
    writePackages get
}

createTemplate() {
    mkdir ./$templateName
    mkdir ./$templateName/$inputType-$templateName

    # Write a individual package
    writePackages $inputType
}

## Create Folder structure based on the User input
if [ "$inputType" == "all" ]
then
    createAllTemplate
else
    createTemplate
fi
