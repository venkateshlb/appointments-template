## Appointments Template

This repo will generate the CRUD operation template required for appointments project.

![https://github.com/venkateshlb/manage-images/blob/master/appointmentsTemplate.png](https://github.com/venkateshlb/manage-images/blob/master/appointmentsTemplate.png)
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
`Template Generation Successfull...` 

You will see the success message once the template is generated!

This will generate you the appointments template codes in the below folder structure

```
template_name
  - create-template_name
     -- lambda.go
  - update-template_name
     -- lambda.go
  - delete-template_name
     -- lambda.go
  - get-template_name
     -- lambda.go
  
```

Similarly you can try executing lambda to create lambda package specifically

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
