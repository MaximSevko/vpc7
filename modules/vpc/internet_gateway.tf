# Create an egress-only internet gateway and associate it with the VPC
resource "aws_egress_only_internet_gateway" "egress_gateway" {
  vpc_id = aws_vpc.vpc7.id
}

# Create an internet gateway and associate it with the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc7.id
}
