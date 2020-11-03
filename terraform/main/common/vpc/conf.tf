terraform {
  required_version = "= 0.13.5"

  backend "s3" {
    region = "ap-northeast-2"

    bucket  = "squaaat-infrastructure"
    key     = "terraform/v1/common/vpc"
    encrypt = true

    dynamodb_table = "squaaat-terraform-lock"
  }
}

provider "aws" {
  version = "3.13.0"
  region  = "ap-northeast-2"
}
