resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  key_name = aws_key_pair.ec2_key.key_name

  subnet_id              = aws_subnet.public-subnet1.id
  vpc_security_group_ids = [aws_security_group.security-group.id]
  iam_instance_profile   = aws_iam_instance_profile.instance-profile.name

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  user_data = templatefile("${path.module}/install-tools.sh", {})

  tags = {
    Name = var.instance_name
  }
}
