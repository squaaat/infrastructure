data "terraform_remote_state" "common" {
  backend = "s3"

  config = {
    bucket  = "squaaat-terraform-state"
    key     = "current/common"
    region  = "ap-northeast-2"
    encrypt = true
  }
}

locals {
  service  = "test"
  role     = "test"
  env      = "test"
  key_name = ""

  ami_id        = "ami-087451feec8ea8919" # bastion 2020-05-25 1308
  instance_type = "t3.small"
  volume_size   = 20

  max_size         = 1
  min_size         = 1
  desired_capacity = 1

  github_accounts = "drake-jin,zynkn"
}

module "bastion" {
  source          = "../../modules/ec2"
  github_accounts = local.github_accounts

  service  = local.service
  role     = local.role
  env      = local.env
  key_name = local.key_name

  ami_id        = local.ami_id
  instance_type = local.instance_type
  volume_size   = local.volume_size

  max_size         = local.max_size
  min_size         = local.min_size
  desired_capacity = local.desired_capacity

  availability_zones = [
    data.terraform_remote_state.common.outputs.az_zones[0],
    data.terraform_remote_state.common.outputs.az_zones[1],
    data.terraform_remote_state.common.outputs.az_zones[2]
  ]

  vpc_zone_identifier = [
    data.terraform_remote_state.common.outputs.subnet_private_an2a_id,
    data.terraform_remote_state.common.outputs.subnet_private_an2b_id,
    data.terraform_remote_state.common.outputs.subnet_private_an2c_id
  ]

  security_groups = [
    data.terraform_remote_state.common.outputs.sg_basic
  ]
  associate_public_ip_address = false

}
