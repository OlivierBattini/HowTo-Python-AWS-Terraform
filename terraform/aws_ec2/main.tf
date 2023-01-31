terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.aws_region
}

resource "aws_security_group" "ssh_ingress" {
  name        = "${var.instance_name}_SSH"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "http_ingress" {
  name        = "${var.instance_name}_HTTP"
  description = "Allow web server access"

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "all_egress" {
  name        = "${var.instance_name}_AllEgress"
  description = "Allow all trafic egress"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.iam_key_name
  
  vpc_security_group_ids = [
    aws_security_group.ssh_ingress.id,
    aws_security_group.http_ingress.id,
    aws_security_group.all_egress.id,
  ]

  tags = {
    Name = var.instance_name
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.instance_username
    private_key = file(var.pem_key_path)
  }

  provisioner "file" {
    source      = var.local_app_path
    destination = "/home/ubuntu/app"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/ubuntu/app/scripts/install.sh",
      "/home/ubuntu/app/scripts/install.sh",
    ]
  }
}
