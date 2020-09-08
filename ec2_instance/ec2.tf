provider "aws" {
  region = "us-east-2"
  profile = "Terraform"
}

resource "aws_instance" "public_instance" {
  ami             = var.ami
  instance_type   = var.ec2_type
  key_name        = var.key_name
  user_data       = file("${path.module}/install_docker_httpd.sh")
  subnet_id       = "subnet-020038fe58f685324"
  security_groups = ["sg-0b6ec695ca5c5af30"]


  tags = {
    Name = "public-instance"
  }
}
