resource "aws_vpc" "main" {
  cidr_block       =var.network_id
  instance_tenancy = "default"

  tags = {
    Name =var.name_vpc
  }
}

#IGW
resource "aws_internet_gateway" "prod-igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "prod-igw"
    }
}

#Public subnet
resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_id
    map_public_ip_on_launch = "true" #it makes this a public subnet
    availability_zone = "us-west-2a"
    tags = {
        Name = "prod-subnet-public-1"
    }
}

# #Private subnet
resource "aws_subnet" "prod-subnet-private-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnet_id
    map_public_ip_on_launch = "false" #it makes this a private subnet
    availability_zone = "us-west-2b"
    tags = {
        Name = "prod-subnet-private-1"
    }
}