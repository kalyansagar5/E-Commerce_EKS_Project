# Generate a new private key
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS EC2 Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "kalyan-ec2-key"
  public_key = tls_private_key.ec2_key.public_key_openssh

  tags = {
    Name = "kalyan-ec2-key"
  }
}

# Save private key locally
resource "local_sensitive_file" "private_key" {
  filename        = "${path.module}/kalyan-ec2-key.pem"
  content         = tls_private_key.ec2_key.private_key_pem
  file_permission = "0600"
}
