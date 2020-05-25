terraform {
  required_version = "= 0.12.24"

  backend "s3" {
    region = "ap-northeast-2"

    bucket  = "squaaat-terraform-state"
    key     = "current/common/route53"
    encrypt = true

    dynamodb_table = "squaaat-terraform-lock"
  }
}

provider "aws" {
  version = "2.54.0"
  region  = "ap-northeast-2"
}
