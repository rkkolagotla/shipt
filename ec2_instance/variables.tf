variable "ami" {
  type = string
  default = "ami-0010d386b82bc06f0"
}

variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "myvpc"
}
