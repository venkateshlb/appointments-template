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

## Create
sed 's/CreateSession/Create'$templateName'/g' template/create-session/lambda.go > $templateName/create-$templateName/lambda.go

## Update
sed 's/UpdateSession/Update'$templateName'/g' template/update-session/lambda.go > $templateName/update-$templateName/lambda.go

## Delete
sed 's/DeleteSession/Delete'$templateName'/g' template/delete-session/lambda.go > $templateName/delete-$templateName/lambda.go

## Get
sed 's/DeleteSession/Get'$templateName'/g' template/get-session/lambda.go > $templateName/get-$templateName/lambda.go