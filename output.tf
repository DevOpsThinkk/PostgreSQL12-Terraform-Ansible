output "public_ip" {
  value       = aws_instance.pgsql_ec2.public_ip
  description = "The public IP of the web server"
}
output "aws_instance_public_dns" {
  value = aws_instance.pgsql_ec2.public_dns
}