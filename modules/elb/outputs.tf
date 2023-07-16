output "elb_id" {
  description = "ELB ID"
  value = aws_elb.web_elb.id
}