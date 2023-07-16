output "aws_security_group" {
    description = "description The ID of the EC2 security group"
    value       = aws_security_group.weather_app.id
}

output "elb_sg" {
  description = "description the ID of the ELB security group"
  value = aws_security_group.elb_sg.id
}
