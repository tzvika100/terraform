variable "network_id" {
    type        = string
    description = "The ID of the network to create your instance in."
    default     = "10.0.0.0/16"
 }

 variable "name_vpc" {
    type        = string
    description = "The name of my vpc."
    default     = "main_vpc"
 }

variable "public_subnet_id" {
    type        = string
    description = "The ID of the subnet to create your instance in."
    default     = "10.0.1.0/24"
 }

variable "private_subnet_id" {
    type        = string
    description = "The ID of the subnet to create your instance in."
    default     = "10.0.2.0/24"
 }

