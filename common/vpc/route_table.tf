resource "aws_route_table" "public" {
  vpc_id = aws_vpc.squaaat.id

  tags = {
    Name = "${local.name}-public"
  }
}

resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.squaaat.id
}



resource "aws_route_table" "private" {
  vpc_id = aws_vpc.squaaat.id

  tags = {
    Name = "${local.name}-private"
  }
}
