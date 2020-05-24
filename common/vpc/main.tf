locals {
  cidr_block = "10.128.0.0/28"
  name       = "squaaat"

  vpc_tags = map(
    "Name", local.name,
    "Resource", "VPC"
  )

}


resource "aws_vpc" "squaaat" {
  cidr_block = local.cidr_block

  assign_generated_ipv6_cidr_block = true

  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags                 = local.vpc_tags

}

resource "aws_internet_gateway" "squaaat" {
  vpc_id = aws_vpc.squaaat.id

  tags = {
    Name = local.name
  }
}


resource "aws_security_group" "basic" {
  name        = "basic"
  description = "default security_group"
  vpc_id      = aws_vpc.squaaat.id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  # VPC 피어링한 상대의 vpc id로 지정할수 없음.
  # https://docs.aws.amazon.com/vpc/latest/peering/vpc-peering-security-groups.html
  # ingress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = -1
  #   cidr_blocks = ["${var.peering_cidrs}"]
  # }

}
