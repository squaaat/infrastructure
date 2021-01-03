# vpc
output "vpc_id" {
  value = aws_vpc.squaaat.id
}

output "vpc_arn" {
  value = aws_vpc.squaaat.arn
}

output "vpc_ipv4_cidr_block" {
  value = aws_vpc.squaaat.cidr_block
}

output "vpc_ipv6_association_id" {
  value = aws_vpc.squaaat.ipv6_association_id
}

output "vpc_ipv6_cidr_block" {
  value = aws_vpc.squaaat.ipv6_cidr_block
}

output "vpc_main_route_table_id" {
  value = aws_vpc.squaaat.main_route_table_id
}

output "vpc_owner_id" {
  value = aws_vpc.squaaat.owner_id
}

output "sg_basic_id" {
  value = aws_security_group.basic.id
}

output "sg_members_id" {
  value = aws_security_group.members.id
}

output "igw_main_id" {
  value = aws_internet_gateway.squaaat.id
}

output "subnet_public" {
  value = module.subnet_public
}

output "subnet_private" {
  value = module.subnet_private
}
