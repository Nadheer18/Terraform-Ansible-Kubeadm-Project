resource "aws_instance" "DevOps-Server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.k8s_sg.id]

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "DevOps-Server"
  }
  user_data = file("scripts/DevOps-Server.sh")
}