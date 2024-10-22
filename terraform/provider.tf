terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.72.1"
    }
  }

  #backend "s3" {
  #  bucket = "terraform-state-0235"
  #  key    = "voting/terraform.tfstate"
  #  region = "ap-southeast-1"
  #}
}

provider "aws" {
  region = "ap-southeast-1"
}
