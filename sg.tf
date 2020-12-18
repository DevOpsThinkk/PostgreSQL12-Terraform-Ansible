# Create security group and use variable inside the CIDR block so we can modify the CIDR block on fly.
resource "aws_security_group" "pgsql_sec_grp" {
  name        = "pgsql_sec_grp"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.pgsql_vpc.id
  tags = {
    Name = "pgsql_sec_grp"
  }
  dynamic "ingress" {
    for_each = var.server_ports
    iterator = port
    content {
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
}