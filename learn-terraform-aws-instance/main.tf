terraform {
  # Terraform Cloudを設定
  cloud {
    organization = "learn-terraform-aws-itoo"
    workspaces {
      name = "terraform"
    }
  }

  # AWS
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

# resource "aws_instance" "app_server" {
#   ami           = "ami-0091f05e4b8ee6709"
#   instance_type = "t2.micro"

#   tags = {
#     Name = var.instance_name
#   }
# }
