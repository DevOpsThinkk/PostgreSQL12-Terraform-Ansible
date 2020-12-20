# Public subnet creation
resource "aws_subnet" "pgsql_public_subnet" {
  vpc_id                  = aws_vpc.pgsql_vpc.id
  cidr_block              = "10.10.10.0/28"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "pgsql_public_subnet"
  }
}
/*
# Private subnet creation
resource "aws_subnet" "pgsql_private_subnet" {
  vpc_id     = aws_vpc.pgsql_vpc.id
  cidr_block = "10.10.0.16/28"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "pgsql_private_subnet"
  }
}
*/