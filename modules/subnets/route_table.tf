resource "aws_route_table" "private_subnet_route_table" {
  # Create one route table per private subnet
  count = length(var.private_subnet_cidr_blocks)

  # Associate with the VPC
  vpc_id = aws_vpc.vpc7.id

  # Route all traffic to the egress-only internet gateway
  route {
    cidr_block = "::/0"
    gateway_id = aws_egress_only_internet_gateway.egress_gateway.id
  }

  # Add a unique name tag for each route table
  tags = {
    Name = "private-subnet-route-table-${count.index}"
  }
}

resource "aws_route_table" "intra_subnet_route_table" {
  # Create one route table per intra subnet
  count = length(var.intra_subnet_cidr_blocks)

  # Associate with the VPC
  vpc_id = aws_vpc.vpc7.id

  # Route all traffic to the internet gateway
  route {
    cidr_block = "::/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  # Add a unique name tag for each route table
  tags = {
    Name = "intra-subnet-route-table-${count.index}"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  # Associate each private subnet with its corresponding route table
  count          = length(var.private_subnet_cidr_blocks)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_subnet_route_table[count.index].id
}

resource "aws_route_table_association" "intra_subnet_association" {
  # Associate each intra subnet with its corresponding route table
  count          = length(var.intra_subnet_cidr_blocks)
  subnet_id      = aws_subnet.intra_subnet[count.index].id
  route_table_id = aws_route_table.intra_subnet_route_table[count.index].id
}
