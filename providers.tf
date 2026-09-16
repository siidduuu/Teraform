terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.80" # 🚀 Forces Terraform to pick up a newly signed binary version
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

