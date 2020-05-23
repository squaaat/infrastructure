
locals {
  stage = "alpha"
}

module "cognito_user_pool" {
  source = "../../modules/cognito"

  stage = local.stage
}
