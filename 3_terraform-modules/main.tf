provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source              = "./modules/ec2-creation"
  ami_value           = "ami-007020fd9c84e18c7"
  instance_type_value = "t2.micro"
  instance_name       = "example-3"
}
