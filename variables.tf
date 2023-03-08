variable "aws_region" {
    default = "us-east-1"
}

# Define the VPC and subnet CIDR blocks
variable "vpc_cidr_block" {
  default = "2001:db8:1234:1a00::/56"
}
