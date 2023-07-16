output "vpc_id" {
    description = "description  The ID of the VPC"
    value       = aws_vpc.main.id
}

output "gateway_id" {
    description =   "description The ID of the gateway"
    value       =   aws_internet_gateway.prod-igw.id
}

output "public_subnet_id" {
    description =   "description The ID of the public subnet"
    value       =   aws_subnet.prod-subnet-public-1.id
}



output "private_subnet_id" {
    description = "description The ID of the private subnet"
    value       = aws_subnet.prod-subnet-private-1.id
}
