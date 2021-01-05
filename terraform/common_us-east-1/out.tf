variable "db_password" {
  type = string
}

output "vpc" {
  value = module.vpc
}

output "route53_zone" {
  value = module.route53_zone
}

output "acm_squaaat_root" {
  value = {
    arn = module.acm_squaaat_root.acm.arn
    id = module.acm_squaaat_root.acm.id
  }
}

output "acm_squaaat_sub" {
  value = {
    arn = module.acm_squaaat_sub.acm.arn
    id = module.acm_squaaat_sub.acm.id
  }
}

output "route53_records" {
  value = zipmap(
    list(
      "route53_record_github_validation",
    ),
    list(
      module.route53_record_github_validation.record.id,
    )
  )
}

output "db" {
  value = module.rds
}


