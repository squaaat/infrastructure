# pickstudio.io
resource "aws_route53_zone" "zone" {
  name = var.zone_name

  comment = "Managed by Terraform"
}

# for aws acm validation
resource "aws_route53_record" "routes" {
  for_each = {
    for route in var.routes : route.sub_domain => route
  }

  zone_id = aws_route53_zone.zone.id
  name = "${each.value.sub_domain}${aws_route53_zone.zone.name}."
  type    = each.value.type
  ttl     = each.value.ttl
  records = each.value.records
}

variable "routes" {
  type = list(
    object({
      sub_domain = string
      type = string
      ttl = string
      records = list(string)
    })
  )
}

variable "zone_name" {
  type = string
}

output "zone_id" {
  value = aws_route53_zone.zone.id
}

output "zone_name" {
  value = aws_route53_zone.zone.name
}

output "routes" {
  value = aws_route53_record.routes
}
