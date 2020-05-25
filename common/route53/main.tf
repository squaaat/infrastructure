# squaaat.com
resource "aws_route53_zone" "squaaat_com" {
  name = "squaaat.com"

  comment = "Managed by Terraform"
}

# for aws acm validation
resource "aws_route53_record" "squaaat_acm_validation" {
  zone_id = aws_route53_zone.squaaat_com.zone_id
  name    = "_4fca4868e4a0e835bd025bc79e1e7591.squaaat.com."
  type    = "CNAME"
  ttl     = "300"
  records = [
    "_a2f763f21db728b89d13635d502a928c.auiqqraehs.acm-validations.aws."
  ]
}

# for github validation
resource "aws_route53_record" "squaaat_github_validation" {
  zone_id = aws_route53_zone.squaaat_com.zone_id
  name    = "_github-challenge-squaaat.squaaat.com."
  type    = "TXT"
  ttl     = "300"
  records = [
    "f85cb7b730"
  ]
}
