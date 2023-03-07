resource "aws_route_table" "private_subnet_route_table" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_egress_only_internet_gateway.example_egress_gateway.id
  }

  tags = {
    Name = "private-subnet-route-table-${count.index}"
  }
}

resource "aws_route_table" "intra_subnet_route_table" {
  count = length(var.intra_subnet_cidr_blocks)

  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }

  tags = {
    Name = "intra-subnet-route-table-${count.index}"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_cidr_blocks)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_subnet_route_table[count.index].id
}

resource "aws_route_table_association" "intra_subnet_association" {
  count          = length(var.intra_subnet_cidr_blocks)
  subnet_id      = aws_subnet.intra_subnet[count.index].id
  route_table_id = aws_route_table.intra_subnet_route_table[count.index].id
}

