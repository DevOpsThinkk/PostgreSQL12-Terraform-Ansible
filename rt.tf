# Creatimg public Route Table
resource "aws_route_table" "pgsql_public_route_table" {
  vpc_id = aws_vpc.pgsql_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pgsql_igw.id
  }
  tags = {
    Name = "pgsql_public_route_table"
  }
}
/*
# Creatimg Private Route Table
resource "aws_route_table" "pgsql_private_route_table" {
  vpc_id = aws_vpc.pgsql_vpc.id
route {
    cidr_block = "0.0.0.0/0"
    }
  tags = {
    Name = "pgsql_private_route_table"
  }
}
*/