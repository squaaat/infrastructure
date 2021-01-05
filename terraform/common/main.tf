locals {
  meta = {
    team = "squaaat"
    service = "squaaat"
    env = "alpha"
  }
}

module "vpc" {
  source = "../modules/vpc"
  meta   = local.meta

  cidr_block = "10.128.0.0/16"
}

module "route53_zone" {
  source = "../modules/route53_zone"

  zone_name = "squaaat.com"
}

module "route53_record_acm_validation" {
  source = "../modules/route53_record"

  zone_id = module.route53_zone.zone_id
  domain = "_4fca4868e4a0e835bd025bc79e1e7591.${module.route53_zone.zone_name}"
  type = "CNAME"
  ttl = "300"
  records = [
    "_a2f763f21db728b89d13635d502a928c.auiqqraehs.acm-validations.aws."
  ]
}

module "route53_record_github_validation" {
  source = "../modules/route53_record"

  zone_id = module.route53_zone.zone_id
  domain = "_github-challenge-squaaat.${module.route53_zone.zone_name}"
  type = "TXT"
  ttl = "300"
  records = [
    "f85cb7b730",
  ]
}

data "aws_availability_zone" "a" {
  name = "ap-northeast-2a"
}

variable "db_password" {
  type = string
}

module "rds" {
  source = "../modules/rds_instance"

  meta = local.meta
  vpc_id = module.vpc.vpc_id
  sg_ids = [module.vpc.sg_basic_id]
  subnet_ids = [
    module.vpc.subnet_public_a_id,
    module.vpc.subnet_public_b_id,
  ]

  db_password = var.db_password
  db_meta = {
    az = data.aws_availability_zone.a.name,
    engine = "mysql"
    engine_version        = "8.0.20"
    instance_class        = "db.t2.micro"
    volume_size = 20
    maximum_volume_size = 100
    dbname = "squaaat"
    username = "grandcanyon"
  }
}