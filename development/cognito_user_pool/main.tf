locals {
  stage = "alpha"
}

module "squaaat" {
  source = "../../modules/cognito_user_pool"

  stage = local.stage
}
