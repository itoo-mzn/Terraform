terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-1"
}

variable "instance_name" {
  description = "EC2 instance name"
  type = string
  default = "ExampleAppServerInstance"
  
}
resource "aws_instance" "app_server" {
  ami           = "ami-0091f05e4b8ee6709"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
