variable "private_subnet_cidr_blocks" {
  default = ["fd00:10:1::/64", "fd00:10:2::/64", "fd00:10:3::/64"]
}

variable "intra_subnet_cidr_blocks" {
  default = ["fd00:20:1::/64", "fd00:20:2::/64", "fd00:20:3::/64"]
}
