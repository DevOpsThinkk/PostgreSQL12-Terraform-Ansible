resource "aws_instance" "PostgreSQL" {
  ami               = "ami-0e472933a1395e172"
  availability_zone = "us-west-2a"
  tags = {
    Name = "PostgreSQL"
  }
}

  provisioner "remote-exec" {
    inline = ["sudo yum update -y"]

    connection {
      type        = "ssh"
      user        = "ansadmin"
      private_key = "${file(var.ssh_key_private)}"
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u ansadmin -i '${self.public_ip},' --private-key ${var.ssh_key_private} provision.yml" 
  }