locals {
  meta = {
    team = "squaaat"
    service = "squaaat"
    env = "alpha"
  }
}

module "acm_squaaat_root" {
  source = "../modules/acm"

  zone_id = data.terraform_remote_state.common.outputs.route53_zone.zone_id
  domain_name = "squaaat.com"
}

module "acm_squaaat_sub" {
  source = "../modules/acm"

  zone_id = data.terraform_remote_state.common.outputs.route53_zone.zone_id
  domain_name = "*.squaaat.com"
}
