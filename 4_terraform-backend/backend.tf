terraform {
  backend "s3" {
    bucket = "terraform-statefile-storage-divya"
    key    = "divya/terraform.tfstate"
    region = "ap-south-1"
  }
}