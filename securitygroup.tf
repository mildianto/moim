resource "aws_security_group" "moim-app" {
  vpc_id      = aws_vpc.moim-vpc.id
  name        = "moim-app"
  description = "security group that allow to Moim Services and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = var.srin_bastion_ingress_cidr
    description = "ssh"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks  = var.web_ingress_cidr
    description = "http"
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks  = var.web_ingress_cidr
    description = "https"
  }
  ingress {
    from_port   = 4443
    to_port     = 4443
    protocol    = "tcp"
    cidr_blocks  = var.web_ingress_cidr
    description = "moim application"
  }
  ingress {
    from_port   = 40000
    to_port     = 49999
    protocol    = "tcp"
    cidr_blocks  = var.web_ingress_cidr
    description = "moim application"
  }

}
