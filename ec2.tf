data "aws_ami" "ubuntu" {
  most_recent = true
  tags = {
    Name = "build-on"
  }
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-${var.os_version}-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  owners = ["099720109477"] #Canonical
}


resource "aws_instance" "mysqlclutser-test" {

    ami = data.aws_ami.ubuntu.id 
    instance_type = "t2.micro" 
    key_name= "${var.env_name}-aws_key"
    #key_name = "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]
    tags = {
    Name = "${var.env_name}-mysql_cluster"
    }

  provisioner "file" {
    source      = "ansible.sh"
    destination = "/tmp/ansible.sh"

  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/ansible.sh",
      "/tmp/ansible.sh"
    ]
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("aws_key")
      timeout     = "4m"
   }



}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  },
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 3000
  }
  ]
}


resource "aws_key_pair" "deployer" {
  key_name   = "${var.env_name}-aws_key"
  
  #key_name = "aws_key"
  public_key = file("aws_key.pub")
  # tags = {
  # Name = "${var.env_name}-keypair"
  #   }
}
