terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # This allows any 5.x version starting from 5.80, but explicitly skips the broken 5.100.0
      version = ">= 5.80, != 5.100.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

