variable "aws_region" {
 default = "ap-southeast-1"
}

variable "availability_zones" {
  type = list(string)
  default = [
    "ap-southeast-1a"
  ]
}

variable "project_name" {
  default = "moim"
}

variable "vpc_cidr" {
	default = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.10.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.10.2.0/24"
}

variable "path_to_moim_public_key" {
  default = "moim-app-key.pub"
}

variable ami_aws {
  type = map
  default = {
    "ap-southeast-1" = "ami-0c20b8b385217763f"
  }
}

variable "web_ingress_cidr"   {
  type = list(string)
  default = [
    "0.0.0.0/0"
  ]
}

variable "srin_bastion_ingress_cidr"   {
  type = list(string)
  default = [
    "43.231.128.61/32",
    "103.58.100.34/32"
  ]
}

variable "db_ingress_cidr"   {
  type = list(string)
  default = [
    "10.10.1.0/24"
  ]
}
