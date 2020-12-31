resource "aws_vpc" "squaaat" {
  cidr_block = var.cidr_block

  assign_generated_ipv6_cidr_block = true

  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Team = var.meta.team,
  }
}

resource "aws_internet_gateway" "squaaat" {
  vpc_id = aws_vpc.squaaat.id

  tags = {
    Name = "${var.meta.team}-igw"
  }
}

resource "aws_security_group" "members" {
  name        = "members"
  description = "access for squaaat crews"
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

  ingress {
    security_groups = [aws_security_group.members.id]
    from_port       = 0
    to_port         = 0
    protocol        = -1
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
