terraform {
  required_version = "0.14.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.22.0"
    }
  }

  backend "s3" {
    bucket         = "squaaat-infrastructure"
    key            = "terraform/common_us-east-1"
    region         = "ap-northeast-2"
    dynamodb_table = "squaaat-terraform-lock"
    encrypt        = true
  }
}

data "terraform_remote_state" "common" {
  backend = "s3"

  config = {
    bucket  = "squaaat-infrastructure"
    key     = "terraform/common"
    region  = "ap-northeast-2"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}
