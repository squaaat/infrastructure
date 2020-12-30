locals {
  meta = {
    team = "squaaat"
  }
}

module "vpc" {
  source = "../modules/vpc"
  meta = local.meta

  cidr_block = "10.128.0.0/16"
}