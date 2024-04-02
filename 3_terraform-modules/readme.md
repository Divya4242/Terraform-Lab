### Terraform modules are a way to organize and encapsulate Terraform configurations into reusable components. 

### Example of a simple Terraform module directory structure:
ec2-creation/
├── main.tf
├── variables.tf
├── outputs.tf

### in this example 'ec2-creation' is a Terraform module that defines resources for a ec2. The    main.tf file contains the configuration for the ec2 resources, variables.tf defines input variables, and outputs.tf defines output variables.

### same we can create for the s3-bucket-creation:
s3-bucket-creation/
├── main.tf
├── variables.tf
├── outputs.tf

### after that, create final main.tf in folder to mention those module. 
provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source              = "./modules/ec2-creation"
  ami_value           = "ami-007020fd9c84e18c7"
  instance_type_value = "t2.micro"
  instance_name       = "example-3"
}

module "s3_creation" {
  source              = "./modules/s3-bucket-creation"
}
