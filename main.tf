terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

# resource "aws_instance" "app_server" {
#   ami           = "ami-0735c191cf914754d"
#   instance_type = "t2.micro"
#   key_name ="Tzvi-Devops-Course"
#   subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
#   vpc_security_group_ids  =  [aws_security_group.weather_app.id]

#   tags = {
#     Name = "Wather_App"
#   }

#   user_data =<<-EOF
#     #! /bin/bash
#     sudo -i
#     sudo apt update
#     sudo apt upgrade -y
#     # sudo wget https://packages.chef.io/files/stable/chef-workstation/23.5.1040/ubuntu/22.04/chef-workstation_23.5.1040-1_amd64.deb
#     # sudo dpkg -i chef-workstation_23.5.1040-1_amd64.deb
#     # #echo "Chef version is: " $(chef --version) >chef_version.txt
#     # git clone https://github.com/tzvika100/Chef.git
#     # cd chef
#     # mkdir cookbooks
#     # cd cookbooks
#     # chef generate cookbook main -b --chef-license=accept
#     # cd /Chef/
#     # mv default.rb cookbooks/main/recipes/
#     #chef-solo -c solo.rb -j runlist.json --chef-license=accept
#    EOF
# }

module "vpc" {
  source    = "./modules/vpc"
  name_vpc  = "project"
}

module "network" {
  source            =  "./modules/network"
  vpc_id            =   module.vpc.vpc_id
  gateway_id        =   module.vpc.gateway_id
  public_subnet_id  =   module.vpc.public_subnet_id
  private_subnet_id =   module.vpc.private_subnet_id
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id  = module.vpc.vpc_id
}

module "ec2" {
  source              = "./modules/ec2"
  vpc_id              = module.vpc.vpc_id
  aws_security_group  = module.security_group.aws_security_group
  #subnet_id           = [module.vpc.private_subnet_id, module.vpc.public_subnet_id]
  subnet_id           = module.vpc.public_subnet_id
  user_data           = file("user_data.sh")
}

module "s3"{
  source = "./modules/s3"
  bucket_name = "my-storage-apk2"
}


module "elb" {
  source            = "./modules/elb"
  elb_sg            = module.security_group.elb_sg
  private_subnet_id = module.vpc.private_subnet_id
  public_subnet_id  = module.vpc.public_subnet_id
  ec2_id            = module.ec2.ec2_id
}

module "asg" {
  source              = "./modules/asg"
  #ami
  #instance_type =
  aws_security_group  = module.security_group.aws_security_group
  user_data           = file("user_data.sh")
  elb_id              = module.elb.elb_id
  subnet_id           = module.vpc.private_subnet_id
}
