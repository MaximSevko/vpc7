output "vpc_id" {
  value = aws_vpc.vpc7.id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet.id
}

output "intra_subnet_ids" {
  value = aws_subnet.intra_subnet.*.id
}

output "internet_gateway_id" {
  value = igw.igw.id
}

output "egress_gateway_id" {
  value = aws_egress_only_internet_gateway.egress_gateway.id
}

output "private_subnet_ipv6_cidr_blocks" {
  value = aws_subnet.private_subnet.ipv6_cidr_block
}

output "intra_subnet_ipv6_cidr_blocks" {
  value = aws_subnet.intra_subnet.ipv6_cidr_block
}
