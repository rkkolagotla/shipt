variable "vpc_id" {
   default = "vpc-04926c79"
}

#########################
#EC2 Image
#########################

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20190722.1"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

############################
#Sec Grp && VPC
############################

data "aws_vpc" "select" {
  id = var.vpc_id
}


