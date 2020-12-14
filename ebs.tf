resource "aws_ebs_volume" "PGSQL_EBS" {
  availability_zone = "us-west-2a"
  size              = 10
  type              = "io2"
  tags = {
    Name = "PGSQL_EBS"
  }
}