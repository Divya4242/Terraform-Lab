# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example-1" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"

  tags = {
    Name = "example-1"
  }
}

# resource "aws_s3_bucket" "example" {
#   bucket = "terraform-statefile-storage-divya"
# }