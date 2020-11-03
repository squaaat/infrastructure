terraform {
  required_version = "= 0.13.2"

  backend "s3" {
    region = "ap-northeast-2"

    bucket = "squaaat-infrastructure"
    key    = "terraform/v1/common/vpc/subnets/private"

    encrypt = true

    dynamodb_table = "squaaat-terraform-lock"
  }
}

provider "aws" {
  version = "3.5.0"
  region  = "ap-northeast-2"
}

data "terraform_remote_state" "common_vpc" {
  backend = "s3"

  config = {
    bucket = "squaaat-infrastructure"
    key     = "terraform/v1/common/vpc"
    region  = "ap-northeast-2"
    encrypt = true
  }
}

data "aws_availability_zone" "a" {
  name = "ap-northeast-2a"
}

data "aws_availability_zone" "b" {
  name = "ap-northeast-2b"
}

data "aws_availability_zone" "c" {
  name = "ap-northeast-2c"
}

data "aws_availability_zone" "d" {
  name = "ap-northeast-2d"
}

