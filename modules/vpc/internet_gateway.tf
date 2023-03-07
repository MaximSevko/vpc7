resource "aws_egress_only_internet_gateway" "egress_gateway" {
  vpc_id = aws_vpc.vpc7.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc7.id
}
