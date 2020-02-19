#!/usr/bin/env bash

echo Hello, Enter the Template name

read templateName

## Create Folder structure
if [ ! -d "$templateName" ]
then
    mkdir ./$templateName
    mkdir ./$templateName/"create-$templateName"
    mkdir ./$templateName/"update-$templateName"
    mkdir ./$templateName/"delete-$templateName"
    mkdir ./$templateName/"get-$templateName"
fi

capitalizeTemplate="$(tr '[:lower:]' '[:upper:]' <<< ${templateName:0:1})${templateName:1}"

## Create
sed 's/CreateSession/Create'$capitalizeTemplate'/g' template/create-session/lambda.go > $templateName/create-$templateName/lambda.go

## Update
sed 's/UpdateSession/Update'$capitalizeTemplate'/g' template/update-session/lambda.go > $templateName/update-$templateName/lambda.go

## Delete
sed 's/DeleteSession/Delete'$capitalizeTemplate'/g' template/delete-session/lambda.go > $templateName/delete-$templateName/lambda.go

## Get
sed 's/DeleteSession/Get'$capitalizeTemplate'/g' template/get-session/lambda.go > $templateName/get-$templateName/lambda.go