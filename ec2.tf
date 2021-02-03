resource "aws_instance" "moim-app" {
  ami                         = lookup(var.ami_aws,"ap-southeast-1")
  associate_public_ip_address = "true"
  availability_zone           = "ap-southeast-1a"

  disable_api_termination = "true"
  instance_type           = "t3.small"
  key_name                = "${var.project_name}-app-key"

  root_block_device {
    delete_on_termination = "false"
    volume_size           = "50"
  }

  subnet_id         = aws_subnet.moim-public.id
  
  #Nat instance requirement
  source_dest_check    = false

  tags = {
    Name = "${var.project_name}-app"
  }

  vpc_security_group_ids = [aws_security_group.moim-app.id]
}
