variable "vpc_id" {
    type        =   string
    description =   "VPC ID"
    default     =   "vpc_id"
}

variable "ami" {
    type        = string
    description = "ami"
    default     = "ami-0735c191cf914754d"
}

variable "instance_type" {
    type        = string
    description = "instance type"
    default     = "t2.micro"
}


# variable "subnet_id" {
#     type    =  list(string)
#     #default = []
#     description = "subnet_id"
# }

variable "subnet_id" {
  type = string
  description = "private subnet"
}



variable "aws_security_group" {
    type = string
    description = "aws_security_group"
}

variable "user_data" {
  type = string
  description = "user data "
}


