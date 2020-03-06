## Appointments Template

This tool will generate the CRUD operation template required for appointments project.

![https://github.com/venkateshlb/manage-images/blob/master/AppointsTemplateExplainOperation.png](https://github.com/venkateshlb/manage-images/blob/master/AppointsTemplateExplainOperation.png)
# What you should do?

Clone this repo and execute this command and here is a demonstration

![https://github.com/venkateshlb/manage-images/blob/master/makeExecutionSteps.gif](https://github.com/venkateshlb/manage-images/blob/master/makeExecutionSteps.gif)

Step 1 - 

```shell 
make template
```

Step 2 -

Enter your desired template name

``` shell
----- Hello, Welcome to Template Generator -----
Enter the Template name:
```

Step 3 - 
Type any one of the below input to perform the code genaration

```shell
* Type all for whole CRUD templates or
* Type create for Create template
* Type update for Update template
* Type delete for Delete template
* Type get for Get template:
```

You can also refer the demonstration. You will see the success message once the template is generated!

```Template Generation Successfull...``` 

Appointments template codes would be created in the below folder structure

Create Folder Structure
```
📦create-Session
 ┣ 📂handler
 ┃ ┗ 📜handler.go
 ┣ 📂lambda
 ┃ ┗ 📜lambda.go
 ┗ 📂service
 ┃ ┗ 📜service.go
```

Whole CRUD folder structure
```
📦Session
 ┣ 📂create-Session
 ┃ ┣ 📂handler
 ┃ ┃ ┗ 📜handler.go
 ┃ ┣ 📂lambda
 ┃ ┃ ┗ 📜lambda.go
 ┃ ┗ 📂service
 ┃ ┃ ┗ 📜service.go
 ┣ 📂delete-Session
 ┃ ┣ 📂handler
 ┃ ┃ ┗ 📜handler.go
 ┃ ┣ 📂lambda
 ┃ ┃ ┗ 📜lambda.go
 ┃ ┗ 📂service
 ┃ ┃ ┗ 📜service.go
 ┣ 📂get-Session
 ┃ ┣ 📂handler
 ┃ ┃ ┗ 📜handler.go
 ┃ ┣ 📂lambda
 ┃ ┃ ┗ 📜lambda.go
 ┃ ┗ 📂service
 ┃ ┃ ┗ 📜service.go
 ┗ 📂update-Session
 ┃ ┣ 📂handler
 ┃ ┃ ┗ 📜handler.go
 ┃ ┣ 📂lambda
 ┃ ┃ ┗ 📜lambda.go
 ┃ ┗ 📂service
 ┃ ┃ ┗ 📜service.go
 ```
 

Similarly you can create Lambda template package

```shell 
make lambda
----- Hello, Welcome to Lambda Template Generator -----
Enter the Lambda template name: lambdaOne
* Type all for whole CRUD templates or
* Type create for Create template
* Type update for Update template
* Type delete for Delete template
* Type get for Get template: create
Lambda Template Generation Successfull...
```

**That is it and you have made it**
