#!/usr/bin/env bash

echo ----- Hello, Welcome to Lambda Template Generator -----
read -p "Enter the Lambda template name: "  lambdaName
read -p "* Type all for whole CRUD templates or
* Type create for Create template
* Type update for Update template
* Type delete for Delete template
* Type get for Get template: "  inputType

capitalizeLambda="$(tr '[:lower:]' '[:upper:]' <<< ${lambdaName:0:1})${lambdaName:1}"
capitalizeInputType="$(tr '[:lower:]' '[:upper:]' <<< ${inputType:0:1})${inputType:1}"

writePackages() {
    getParam=$1
    capitalizeParam="$(tr '[:lower:]' '[:upper:]' <<< ${getParam:0:1})${getParam:1}"

    mkdir ./$lambdaName/$getParam-$lambdaName/lambda

    ## Lambda
    sed 's/'$getParam'/'$capitalizeParam$capitalizeLambda'/g' template/$getParam-session/lambda.go > $lambdaName/$getParam-$lambdaName/lambda/lambda.go
}

createAllLambdaTemplate() {
    mkdir ./$lambdaName
    mkdir ./$lambdaName/"create-$lambdaName"
    mkdir ./$lambdaName/"update-$lambdaName"
    mkdir ./$lambdaName/"delete-$lambdaName"
    mkdir ./$lambdaName/"get-$lambdaName"

    ## Create
    writePackages create

    ## Update
    writePackages update

    ## Delete
    writePackages delete

    ## Get
    writePackages get
}

createLambdaTemplate() {
    mkdir ./$lambdaName
    mkdir ./$lambdaName/$inputType-$lambdaName

    # Write a individual package
    writePackages $inputType
}

## Create Folder structure
if [ "$inputType" == "all" ]
then
    createAllLambdaTemplate
else
    createLambdaTemplate
fi
