output "ec2_id" {
  value = aws_instance.public_instance.id
}

output "ec2_name" {
  value = aws_instance.public_instance.ami
}
