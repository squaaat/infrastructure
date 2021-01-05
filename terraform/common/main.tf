locals {
  meta = {
    team = "squaaat"
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
