# Creating an Elastic IP for the NAT Gateway!
resource "aws_eip" "nat_gateway" {
  #vpc = true
  depends_on = [ var.gateway_id ]
}

# Creating a NAT Gateway!
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.gateway_id]
}

# Creating a Route Table for the Nat Gateway!
resource "aws_route_table" "NAT-Gateway-RT" {
#   depends_on = [
#         aws_nat_gateway.nat_gateway
#   ]
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "Route Table for NAT Gateway"
  }

}

#Routing tables to route traffic for Public Subnet
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
  }

  tags = {
    Name = "main"
  }
}

# Creating an Route Table Association of the NAT Gateway route
resource "aws_route_table_association" "privat-prod-a" {
  subnet_id = var.private_subnet_id # privat subnet
  route_table_id = aws_route_table.NAT-Gateway-RT.id
}

# Creating an Route Table Association of the Internet Gateway route
resource "aws_route_table_association" "public-prod-a" {
  subnet_id = var.public_subnet_id # public subnet
  route_table_id = aws_route_table.public.id
}

