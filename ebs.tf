resource "aws_ebs_volume" "pgsql_ebs" {
  availability_zone = "us-west-2a"
  size              = 4
  type              = "io2"
  tags = {
    Name = "pgsql_ebs"
  }
}

