resource "aws_vpc" "pgsql_vpc" {
  cidr_block           = var.server_vpc_ip
  enable_dns_hostnames = true
  tags = {
    Name = "pgsql_vpc"
  }
}