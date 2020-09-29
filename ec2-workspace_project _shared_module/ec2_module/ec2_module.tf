

variable "ec2ami"{
   # default = "ami-09a7bbd08886aafdf"
}

module "shared_module" {
  source = "../shared_module"
  
}
variable "sg_id"{}

resource "aws_instance" "terraform-ec2" {
  ami           = "${var.ec2ami}"
  instance_type = "t2.micro"
  key_name      = "ec2-key"
  vpc_security_group_ids = ["${var.sg_id}"]

  tags = {
    Name = "ec2_name_${module.shared_module.env_suffix}"
  }
}