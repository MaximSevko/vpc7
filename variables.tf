variable "aws_region" {
    default = "eu-central-1"
}

# Define the VPC and subnet CIDR blocks
variable "vpc_cidr_block" {
  default = "2001:db8:1234:1a00::/56"
}

# Define the IPv6 CIDR blocks for private subnets
variable "private_subnet_cidr_blocks" {
<<<<<<< HEAD
  default = ["2001:db8:1234:1a01::/64", "2001:db8:1234:1a01::/64", "2001:db8:1234:1a01::/64"]
=======
  default = ["fd00:10:1::/64", "fd00:10:2::/64", "fd00:10:3::/64"]
>>>>>>> parent of f164066 (Update variables.tf)
}

# Define the IPv6 CIDR blocks for intra subnets
variable "intra_subnet_cidr_blocks" {
<<<<<<< HEAD
  default = ["2001:db8:1234:1a01::/64", "2001:db8:1234:1a01::/64", "2001:db8:1234:1a01::/64"]
=======
  default = ["fd00:20:1::/64", "fd00:20:2::/64", "fd00:20:3::/64"]
>>>>>>> parent of f164066 (Update variables.tf)
}
