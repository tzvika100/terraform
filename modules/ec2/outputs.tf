# output "ec2_id" {
#     description    =    "instance ID"
#     value          =    aws_instance.app_server[*].id
# }

output "ec2_id" {
    description    =    "instance ID"
    value          =    aws_instance.app_server.id
}
