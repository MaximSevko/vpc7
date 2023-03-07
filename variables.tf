variable "aws_region" {
    default = "eu-central-1"
}

## Define the VPC and subnet CIDR blocks
#variable "vpc_cidr_block" {
#  default = "fd00:10::/56"
#}

# Define the IPv6 CIDR blocks for private subnets
variable "private_subnet_cidr_blocks" {
  default = ["fd00:10:1::/64", "fd00:10:2::/64", "fd00:10:3::/64"]
}

# Define the IPv6 CIDR blocks for intra subnets
variable "intra_subnet_cidr_blocks" {
  default = ["fd00:20:1::/64", "fd00:20:2::/64", "fd00:20:3::/64"]
}
