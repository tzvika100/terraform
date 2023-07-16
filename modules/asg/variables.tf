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

variable "aws_security_group" {
    type = string
    description = "aws_security_group"
}

variable "user_data" {
  type = string
  description = "user data "
}

variable "elb_id" {
  type = string
  description = "ELB ID"
}
variable "subnet_id" {
    type = string
    description = "sebnet ID"
}
