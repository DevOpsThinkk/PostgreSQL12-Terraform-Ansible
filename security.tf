# Create VPC resource and use variable inside the CIDR block so we can modify the CIDR block on fly.
resource "aws_vpc" "pgsql_vpc" {
  cidr_block = var.server_vpc_ip
}
resource "aws_security_group" "sec-grp-pgsql" {
  name        = "sec-grp-pgsql"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.pgsql_vpc.id
  
  dynamic ingress  {
    for_each = var.server_ports
    iterator = port
    content {
    description = "TLS from VPC"
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.pgsql_vpc.cidr_block]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sec-grp-pgsql"
  }
}