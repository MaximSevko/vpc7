# Create a VPC with the specified IPv6 CIDR block
resource "aws_vpc" "vpc7" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "example-vpc"
  }
}
