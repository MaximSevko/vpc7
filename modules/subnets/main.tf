
# Create the private subnets
resource "aws_subnet" "private_subnet" {
  count                  = length(var.private_subnet_cidr_blocks)
  cidr_block             = var.private_subnet_cidr_blocks[count.index]
  vpc_id                 = aws_vpc.main.id
  assign_ipv6_address_on_creation = true
}

# Create the intra subnets
resource "aws_subnet" "intra_subnet" {
  count                  = length(var.intra_subnet_cidr_blocks)
  cidr_block             = var.intra_subnet_cidr_blocks[count.index]
  vpc_id                 = aws_vpc.main.id
  assign_ipv6_address_on_creation = true
}

# Associate the private subnets with the egress-only gateway
resource "aws_subnet_ipv6_cidr_block_association" "private" {
  count           = length(var.private_subnet_cidr_blocks)
  subnet_id       = aws_subnet.private_subnet[count.index].id
  ipv6_cidr_block = aws_subnet.private_subnet[count.index].ipv6_cidr_block_association[0].ipv6_cidr_block
  egress_only_gateway_id = aws_egress_only_internet_gateway.main.id
}

