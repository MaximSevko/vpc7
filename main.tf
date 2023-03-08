# Create a VPC with the specified IPv6 CIDR block
resource "aws_vpc" "vpc7" {
  assign_generated_ipv6_cidr_block = "true"

  tags = {
    Name        = "vpc7"
    Environment = var.env
  }
}

# Create an egress-only internet gateway and associate it with the VPC
resource "aws_egress_only_internet_gateway" "egress_gateway" {
  vpc_id = aws_vpc.vpc7.id

  tags = {
    Name        = "egress-gateway"
    Environment = var.env
  }
}

# Create an internet gateway and associate it with the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc7.id

  tags = {
    Name        = "internet-gateway"
    Environment = var.env
  }
}

# Create the private subnets
resource "aws_subnet" "private_subnet" {
  vpc_id                 = aws_vpc.vpc7.id
  assign_ipv6_address_on_creation = true

  tags = {
    Name        = "private-subnet"
    Environment = var.env
  }
}

# Create the intra subnets
resource "aws_subnet" "intra_subnet" {
  vpc_id                 = aws_vpc.vpc7.id
  assign_ipv6_address_on_creation = true

  tags = {
    Name        = "intra-subnet"
    Environment = var.env
  }
}

resource "aws_route_table" "private_subnet_route_table" {
  # Create one route table per private subnet

  # Associate with the VPC
  vpc_id = aws_vpc.vpc7.id

  # Route all traffic to the egress-only internet gateway
  route {
    cidr_block = "::/0"
    gateway_id = aws_egress_only_internet_gateway.egress_gateway.id
  }

  # Add a unique name tag for each route table
  tags = {
    Name        = "private-subnet-route-table"
    Environment = var.env
  }
}

resource "aws_route_table" "intra_subnet_route_table" {
  # Create one route table per intra subnet

  # Associate with the VPC
  vpc_id = aws_vpc.vpc7.id

  # Route all traffic to the internet gateway
  route {
    cidr_block = aws_subnet.intra_subnet.ipv6_cidr_block
    gateway_id = "local"
  }

  # Add a unique name tag for each route table
  tags = {
    Name        = "intra-subnet-route-table"
    Environment = var.env
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  # Associate each private subnet with its corresponding route table
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_subnet_route_table.id
}

resource "aws_route_table_association" "intra_subnet_association" {
  # Associate each intra subnet with its corresponding route table
  subnet_id      = aws_subnet.intra_subnet.id
  route_table_id = aws_route_table.intra_subnet_route_table.id
}
