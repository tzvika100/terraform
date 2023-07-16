## Creating Launch Configuration
resource "aws_launch_configuration" "example" {
  image_id               =  var.ami
  instance_type          =  var.instance_type
  security_groups        = [var.aws_security_group]
  key_name               =  "Tzvi-Devops-Course"
  user_data              =  var.user_data

  lifecycle {
    create_before_destroy = true
  }
}

## Creating AutoScaling Group
resource "aws_autoscaling_group" "example" {
  launch_configuration =  aws_launch_configuration.example.id
  #availability_zones = ["us-west-2b"]
  vpc_zone_identifier   = [var.subnet_id]
  min_size =  2
  max_size =  4
  load_balancers =  [var.elb_id]
  health_check_type = "ELB"
  tag {
    key = "Name"
    value = "terraform-asg"
    propagate_at_launch = true
  }
}
