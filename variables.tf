variable "aws_region" {
    default = "eu-central-1"
}

# Define the VPC and subnet CIDR blocks
variable "vpc_cidr_block" {
  default = "fd00:1234:5678:9abc::/64"
}

# Define the IPv6 CIDR blocks for private subnets
variable "private_subnet_cidr_blocks" {
  default = ["fd00:1234:5678:9abc:11::/68", "fd00:1234:5678:9abc:12::/68", "fd00:1234:5678:9abc:13::/68"]
}

# Define the IPv6 CIDR blocks for intra subnets
variable "intra_subnet_cidr_blocks" {
  default = ["fd00:1234:5678:9abc:21::/68", "fd00:1234:5678:9abc:22::/68", "fd00:1234:5678:9abc:23::/68"]
}
