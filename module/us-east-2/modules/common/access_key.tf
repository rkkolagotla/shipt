resource "tls_private_key" "access_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "new_key" {
  key_name   = "myasg_key"
  public_key = tls_private_key.access_key.public_key_openssh

  depends_on = [
    tls_private_key.access_key
  ]
}

resource "local_file" "key_file" {
  content         = tls_private_key.access_key.private_key_pem
  filename        = "myasg.pem"
  file_permission = "0600"

  depends_on = [
    tls_private_key.access_key,
    aws_key_pair.new_key
  ]
}
