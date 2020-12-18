# Internet Gateway Creation
resource "aws_internet_gateway" "pgsql_igw" {
  vpc_id = aws_vpc.pgsql_vpc.id
  tags = {
    Name = "pgsql_igw"
  }
}