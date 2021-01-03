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

module "route53" {
  source = "../modules/route53"

  zone_name = "squaaat.com"

  routes = [
     {
      sub_domain = "_4fca4868e4a0e835bd025bc79e1e7591."
      type = "CNAME"
      ttl = "300"
      records = [
        "_a2f763f21db728b89d13635d502a928c.auiqqraehs.acm-validations.aws."
      ]
    },
    {
      sub_domain = "_github-challenge-squaaat."
      type = "TXT"
      ttl = "300"
      records = [
        "f85cb7b730",
      ]
    },
  ]
}

//terraform import -target=module.route53.aws_route53_zone.zone

// terraform import module.route53.aws_route53_record.record["_4fca4868e4a0e835bd025bc79e1e7591."] \
// Z10341293IS3A93HFREOH__4fca4868e4a0e835bd025bc79e1e7591.squaaat.com_CNAME
//
//terraform import module.route53.aws_route53_record.record["_github-challenge-squaaat."] \
//Z10341293IS3A93HFREOH__github-challenge-squaaat.squaaat.com_TXT