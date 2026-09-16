terraform {
  backend "s3" {
    bucket       = "terraform-assignment-state-063392961907"
    key          = "assignment/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1"
}