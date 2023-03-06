
provider "aws" {
  region = var.AWS_Region
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  assign_generated_ipv6_cidr_block = true
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnet_private" {
    for_each = var.availability_zones

    vpc_id = aws_vpc.main.id

    availability_zone = each.key
    // Removed unnecessary code related to IPv6 CIDR block
    //map_public_ip_on_launch = true // Changed to false to make this a private subnet

    tags = {
        Name = "subnet-private-${each.value + 10}"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "igw"
    }
}

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.main.id
    
    route {
        // Associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"
        // CRT uses this IGW to reach the internet
        gateway_id = aws_internet_gateway.igw.id 
    }
    
    tags = {
        Name = "public-rt"
    }
}

// Create an egress-only internet gateway
resource "aws_egress_only_internet_gateway" "egw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table_association" "rta-public-subnet"{
    for_each = var.availability_zones

    subnet_id = aws_subnet.subnet_private[each.key].id
    route_table_id = aws_route_table.public-rt.id
}
