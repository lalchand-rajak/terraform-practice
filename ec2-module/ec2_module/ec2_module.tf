variable "vpcid"{
    type = "string"
    default = "vpc-552b283d"
}

resource "aws_security_group" "terraform-sg" {
  name        = "terraform-sg"
  description = "terraform-sg"
  vpc_id      = "${var.vpcid}"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}

variable "ec2ami"{
    default = "ami-09a7bbd08886aafdf"
}

resource "aws_instance" "terraform-ec2" {
  ami           = "${var.ec2ami}"
  instance_type = "t2.micro"
  key_name      = "ec2-key"
  vpc_security_group_ids = ["${aws_security_group.terraform-sg.id}"]

  tags = {
    Name = "terrafrom-ec2"
  }
}