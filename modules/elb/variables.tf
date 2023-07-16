variable "elb_sg"{
    type        = string
    description = "elb security group"
}

variable "private_subnet_id"{
    type        = string
    description = "Private subnet id"
}

variable "public_subnet_id"{
    type        = string
    description = "Public subnet id"
}



# variable "ec2_id" {
#     type = list(string)
#     description = "ec2_id"
# }

variable "ec2_id" {
    type = string
    description = "ec2_id"
}