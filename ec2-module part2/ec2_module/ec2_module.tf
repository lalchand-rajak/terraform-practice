

variable "ec2ami"{
    default = "ami-09a7bbd08886aafdf"
}

variable "sg_id"{}
variable "ec2_name" {}

resource "aws_instance" "terraform-ec2" {
  ami           = "${var.ec2ami}"
  instance_type = "t2.micro"
  key_name      = "ec2-key"
  vpc_security_group_ids = ["${var.sg_id}"]

  tags = {
    Name = "${var.ec2_name}"
  }
}