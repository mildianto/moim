# Moim VPC
resource "aws_vpc" "moim-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = "true"
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Moim Internet Gateway
resource "aws_internet_gateway" "moim-igw" {
  vpc_id = aws_vpc.moim-vpc.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

# EIP for Moim App
resource "aws_eip" "moim-app-eip" {
  instance = aws_instance.moim-app.id
  vpc = true
  tags = {
    Name = "${var.project_name}-app-eip"
  }
}

#Moim public subnet
resource "aws_subnet" "moim-public" {
  vpc_id = aws_vpc.moim-vpc.id
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = "true"
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "${var.project_name}-public"
  }
}

# Route Table for Moim  Public Subnet 
resource "aws_route_table" "moim-public" {
  vpc_id = aws_vpc.moim-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.moim-igw.id
  }
  tags = {
    Name = "${var.project_name}-public"
  }
}

# Route Table Associations for Moim Public subnet
resource "aws_route_table_association" "moim-public" {
  subnet_id      = aws_subnet.moim-public.id
  route_table_id = aws_route_table.moim-public.id
}
