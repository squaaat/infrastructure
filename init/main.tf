resource "aws_s3_bucket" "terraform-state" {
  bucket = "squaaat-terraform-state"
  acl    = "private"
}

resource "aws_dynamodb_table" "terraform-lock" {
  name = "squaaat-terraform-lock"

  read_capacity  = 2
  write_capacity = 2

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
