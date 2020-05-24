locals {
  name = "bastion"

  ami_id        = "ami-043c433281309b3d5" # bastion 2020-05-23 1824
  instance_type = "t3.small"
  volume_size   = 20

  max_size         = 1
  min_size         = 1
  desired_capacity = 1

  github_accounts = "drake-jin,zynkn"
}

module "bastion" {
  source = "../../modules/ec2"

  name = local.name

  ami_id        = local.ami_id
  instance_type = local.instance_type
  volume_size   = local.volume_size

  max_size         = local.max_size
  min_size         = local.min_size
  desired_capacity = local.desired_capacity


  github_accounts = local.github_accounts
}
