resource "aws_volume_attachment" "pgsql_ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.pgsql_ebs.id
  instance_id = aws_instance.pgsql_ec2.id
}