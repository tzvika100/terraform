resource "aws_instance" "app_server" {
    #count = length(var.subnet_id)
    ami                     =       var.ami
    instance_type           =       var.instance_type
    key_name                =       "Tzvi-Devops-Course"
    #subnet_id               =       var.subnet_id[count.index]
    subnet_id               =       var.subnet_id
    vpc_security_group_ids  =       [var.aws_security_group]
    tags = {
        Name = "Wather_App"
    }

    user_data =var.user_data
}

