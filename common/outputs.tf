# vpc
output "vpc_id" {
  value = data.aws_vpc.squaaat.id
}

output "vpc_arn" {
  value = data.aws_vpc.squaaat.arn
}

output "vpc_cidr_block" {
  value = data.aws_vpc.squaaat.cidr_block
}

output "vpc_ipv6_association_id" {
  value = data.aws_vpc.squaaat.ipv6_association_id
}

output "vpc_ipv6_cidr_block" {
  value = data.aws_vpc.squaaat.ipv6_cidr_block
}

output "vpc_main_route_table_id" {
  value = data.aws_vpc.squaaat.main_route_table_id
}

output "vpc_owner_id" {
  value = data.aws_vpc.squaaat.owner_id
}

# subnet
output "subnet_private_an2a_id" {
  value = data.aws_subnet.squaaat_private_an2a.id
}

output "subnet_private_an2b_id" {
  value = data.aws_subnet.squaaat_private_an2b.id
}

output "subnet_private_an2c_id" {
  value = data.aws_subnet.squaaat_private_an2c.id
}

output "subnet_public_an2a_id" {
  value = data.aws_subnet.squaaat_public_an2a.id
}

output "subnet_public_an2b_id" {
  value = data.aws_subnet.squaaat_public_an2b.id
}

output "subnet_public_an2c_id" {
  value = data.aws_subnet.squaaat_public_an2c.id
}

output "subnet_private_an2a_arn" {
  value = data.aws_subnet.squaaat_private_an2a.arn
}

output "subnet_private_an2b_arn" {
  value = data.aws_subnet.squaaat_private_an2b.arn
}

output "subnet_private_an2c_arn" {
  value = data.aws_subnet.squaaat_private_an2c.arn
}

output "subnet_public_an2a_arn" {
  value = data.aws_subnet.squaaat_public_an2a.arn
}

output "subnet_public_an2b_arn" {
  value = data.aws_subnet.squaaat_public_an2b.arn
}

output "subnet_public_an2c_arn" {
  value = data.aws_subnet.squaaat_public_an2c.arn
}


# aws
output "az_zones" {
  value = [
    data.aws_availability_zone.a.name,
    data.aws_availability_zone.b.name,
    data.aws_availability_zone.c.name
  ]
}

# route53
output "route53_squaat_zone_id" {
  value = data.aws_route53_zone.squaaat.zone_id
}

output "route53_squaaat_zone_name" {
  value = data.aws_route53_zone.squaaat.name
}

output "sg_basic" {
  value = data.aws_security_group.basic.id
}

output "rt_public_id" {
  value = data.aws_route_table.squaaat_public_route_table.id
}

output "rt_private_id" {
  value = data.aws_route_table.squaaat_private_route_table.id
}

