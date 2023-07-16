resource "aws_elb" "web_elb" {
    name = "web-elb"
    security_groups = [var.elb_sg]
    #availability_zones = [ "us-west-2a","us-west-2b"]
    #instances = [var.ec2_id]
    subnets = [var.public_subnet_id , var.private_subnet_id]
    cross_zone_load_balancing   =   true
    health_check{
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        interval = 30
        target = "HTTP:5000/"
    }
    listener {
        lb_port = 80
        lb_protocol = "http"
        instance_port = 5000
        instance_protocol = "http"
    }
}

# resource "aws_lb_target_group" "test" {
#   name     = "tf-example-lb-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = var.vpc_id
# }

# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = aws_lb_target_group.test.arn
#   target_id        = var.ec2_id
#   port             = 80
# }
