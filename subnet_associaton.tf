# Public Subnet Association
resource "aws_route_table_association" "pgsql_public_subnet_asso" {
  subnet_id      = aws_subnet.pgsql_public_subnet.id
  route_table_id = aws_route_table.pgsql_public_route_table.id
}
/*
# Private Subnet Association
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.pgsql_private_subnet.id
  route_table_id = aws_route_table.nginx_private_route_table.id
}
*/