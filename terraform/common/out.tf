variable "db_password" {
  type = string
}

output "vpc" {
  value = module.vpc
}

output "route53_zone" {
  value = module.route53_zone
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

output "s3_lambda" {
  value = {
    id = aws_s3_bucket.squaaat.id,
    arn = aws_s3_bucket.squaaat.arn,
    name = aws_s3_bucket.squaaat.bucket,
    domain_name = aws_s3_bucket.squaaat.bucket_domain_name,
  }
}