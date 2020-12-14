resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.PGSQL_EBS.id
  instance_id = aws_instance.PostgreSQL.id
}