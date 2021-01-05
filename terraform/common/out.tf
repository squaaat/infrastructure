output "vpc" {
  value = module.vpc
}

output "route53_zone" {
  value = module.route53_zone
}

output "route53_records" {
  value = zipmap(
    list(
      "route53_record_acm_validation",
      "route53_record_github_validation",
    ),
    list(
      module.route53_record_acm_validation.record.id,
      module.route53_record_github_validation.record.id,
    )
  )
}

output "db" {
  value = module.rds
}