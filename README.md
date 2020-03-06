## Appointments Template

This tool will generate the CRUD operation template required for appointments project.

![https://github.com/venkateshlb/manage-images/blob/master/AppointsTemplateExplainOperation.png](https://github.com/venkateshlb/manage-images/blob/master/AppointsTemplateExplainOperation.png)
# What you should do?

Clone this repo and execute this command and here is a demonstration

Step 1 - 
Explain will list all the avaiable commands
```shell 
$$ make explain
```

Step 2 - 

	# Generate all CRUD Template 
	# 	$$ make template NAME="templateName" CRUD="all"
	#
	# Generate create Template 
	# 	$$ make template NAME="templateName" CRUD="create"
	#
	# Generate update Template 
	# 	$$ make template NAME="templateName" CRUD="update"
	#
	# Generate delete Template 
	# 	$$ make template NAME="templateName" CRUD="delete"
	#
	# Generate get Template 
	# 	$$ make template NAME="templateName" CRUD="get"
 
 To generate a template run the below command where templateName is the name of your template (i.e session, appointments etc) and input the crud operation.
 
```shell 
$$ make template NAME="templateName" CRUD="all"
```

CRUD Operation Parameter - 
```
all    - Generate whole CRUD Template
create - Generate Create template
update - Generate Update template
delete - Generate Delete template
get    - Generate Get template
```
Step 3 -

You can also refer the demonstration. You will see the success message once the template is generated!

```Template Generation Successfull...``` 

## Folder Structure
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

**That is it and you have made it**
