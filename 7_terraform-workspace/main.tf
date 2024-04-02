provider "aws" {
  region = "ap-south-1"
}

variable "ami" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "ami-007020fd9c84e18c7" # Ubuntu
    "stage" = "ami-05ac570307b6820b7" # Windows
    "prod" = "ami-05a5bb48beb785bf1" # Red-hat 
  }
}

variable "instance_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}

resource "aws_instance" "example-1"  {
  ami           = lookup(var.ami, terraform.workspace, "ami-007020fd9c84e18c7")
  # understanding lookup: lookup:(var.ami, terraform.workspace, "ami-007020fd9c84e18c7")
  # var.ami value will be selected based on the terraform.workspace value. 
  # terraform.workspace value we defined when we selected workspace by writing 
  # terraform workspace select dev
  # "ami-007020fd9c84e18c7" is the default value when no ami matched.
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}