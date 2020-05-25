resource "aws_s3_bucket" "context" {
  bucket = "squaaat-secrets"
  acl    = "private"

  versioning {
    enabled = true
  }
  tags = {
    Service     = "squaaat"
    Environment = "common"
  }
}
