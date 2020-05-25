resource "aws_s3_bucket" "context" {
  bucket = "squaaat-context"
  acl    = "private"

  versioning {
    enabled = true
  }
  tags = {
    Service     = "squaaat"
    Environment = "common"
  }
}
