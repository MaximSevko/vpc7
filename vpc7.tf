# Configure the AWS provider
provider "aws" {
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_ipv6 = true
}

# Create an internet gateway and attach it to the VPC
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
}

# Create an egress-only internet gateway and attach it to the VPC
resource "aws_egress_only_internet_gateway" "example_egress" {
  vpc_id = aws_vpc.example_vpc.id
}

# Create the private subnets
resource "aws_subnet" "example_private_subnet_1" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.example_vpc.ipv6_cidr_block, 8, 1)}"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "example_private_subnet_2" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.2.0/24"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.example_vpc.ipv6_cidr_block, 8, 2)}"
  availability_zone = "us-west-2b"
}

resource "aws_subnet" "example_private_subnet_3" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.3.0/24"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.example_vpc.ipv6_cidr_block, 8, 3)}"
  availability_zone = "us-west-2c"
}

# Create the intra subnets
resource "aws_subnet" "example_intra_subnet_1" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.4.0/24"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.example_vpc.ipv6_cidr_block, 8, 4)}"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "example_intra_subnet_2" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.5.0/24"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.example_vpc.ipv6_cidr_block, 8, 5)}"
  availability_zone = "us-west-2b"
}

resource "aws_subnet" "example_intra_subnet_3" {
  vpc_id = aws_vpc.example_vpc.id
  cidr_block = "10.0.6.0/24"
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.example_vpc.ipv6_cidr_block, 8, 6)}"
  availability_zone = "us-west-2c"
}

# Create a route table for the private subnets and associate them with the route table
resource "aws_route_table" "example_private_rt" {
  vpc_id = aws_vpc.example_vpc.id
}
