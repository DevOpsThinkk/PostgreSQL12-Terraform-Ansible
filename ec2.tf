resource "aws_instance" "pgsql_ec2" {
  ami                    = "ami-0e472933a1395e172"
  availability_zone      = "us-west-2a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.pgsql_sec_grp.id]
  subnet_id              = aws_subnet.pgsql_public_subnet.id
  key_name               = "Naresh"
  tags = {
    Name = "pgsql_ec2"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo uptime"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.pgsql_ec2.private_ip} >> host.txt"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -u ec2-user -i '${self.public_ip},' --private-key ${file("./Naresh.pem")} playbook.yml"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./Naresh.pem")
    host        = self.public_ip
  }
}