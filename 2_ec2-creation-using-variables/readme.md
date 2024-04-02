## Terraform Variables: used to parameterize configurations, allowing you to reuse and customize your infrastructure definitions. 

## Variable types: 1. Input variables 2. Output Variables
### 1. Input Variables: Input variables allow you to parameterize your Terraform configurations, enabling you to reuse configurations across different environments, customize resources, and keep sensitive information separate from your code.
### 2. Output Variables: Output variables allow you to expose information about your infrastructure that allow you to store in a state file, or display to users.

### terraform.tfvars = stores actual value
### variables.tf = used to name variable
### main.tf = here it will fetch the variable values
### outputs.tf = it will show output on terminal for mentioned variable.