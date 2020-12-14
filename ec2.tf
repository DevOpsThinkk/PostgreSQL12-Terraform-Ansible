resource "aws_instance" "PostgreSQL" {
  ami               = "ami-0e472933a1395e172"
  availability_zone = "us-west-2a"
  instance_type = "t2.micro"
  key_name = "Naresh"
  tags = {
    Name = "PostgreSQL"
  }

  provisioner "remote-exec" {
    inline = ["sudo yum update -y"]
/*
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("./Naresh.pem")}"
    }
*/    
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u ec2-user -i '${self.public_ip},' --private-key ${file("./Naresh.pem")} provision.yml" 
 /* 
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = "${file("./Naresh.pem")}"
  }
*/  
}
}