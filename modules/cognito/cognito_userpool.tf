resource "aws_cognito_user_pool" "squaaat" {
  name = "squaaat_${var.stage}"

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

  }
}
