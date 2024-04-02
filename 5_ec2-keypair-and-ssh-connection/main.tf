# Define AWS provider
provider "aws" {
  region = "ap-south-1"  # Change this to your desired region
}

# Define key pair
resource "aws_key_pair" "my_keypair" {
  key_name   = "my-keypair"
  public_key = file("~/.ssh/id_rsa.pub")  # Path to your public key file
}


resource "aws_security_group" "webSg" {
  name   = "terraform"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}

# Launch EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_keypair.key_name  # Attach key pair to the instance

  tags = {
    Name = "example-instance"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    private_key = file("~/.ssh/id_rsa")  # Replace with the path to your private key
    host        = self.public_ip
  }

    provisioner "remote-exec" {
    inline = [
      "cd /home/ubuntu",
      "touch abc.txt"
    ]
  }
}

# Output instance's public IP
output "instance_public_ip" {
  value = aws_instance.example_instance.public_ip
}
