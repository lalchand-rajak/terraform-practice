variable "vpcid"{
    type = "string"
    default = "vpc-552b283d"
}

variable "sg_name"{ }
resource "aws_security_group" "terraform-sg-module" {
  name        = "${var.sg_name}"
  description = "terraform-sg-module"
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
    Name = "terraform-sg-module"
  }
}

output "sgid-output"{
    value = "${aws_security_group.terraform-sg-module.id}"
}
