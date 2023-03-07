variable "aws_region" {
    default = "eu-central-1"
}

# Define the VPC and subnet CIDR blocks
variable "vpc_cidr_block" {
  default = "2001:db8:1234:1a00::/56"
}

# Define the IPv6 CIDR blocks for private subnets
variable "private_subnet_cidr_blocks" {
  default = ["2001:db8:1234:1a01::/64", "2001:db8:1234:1a01::/64", "2001:db8:1234:1a01::/64"]
}

# Define the IPv6 CIDR blocks for intra subnets
variable "intra_subnet_cidr_blocks" {
  default = ["2001:db8:1234:1a01::/64", "2001:db8:1234:1a01::/64", "2001:db8:1234:1a01::/64"]
}
