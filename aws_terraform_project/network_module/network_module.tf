
module "shared_vars" {
    source = "../shared_vars"
    
}

resource "aws_security_group" "public_sg" {
  name        = "sg_public_${module.shared_vars.env_suffix}"
  description = "public_loadbanalncer_${module.shared_vars.env_suffix}"
  vpc_id      = "${module.shared_vars.vpcid}"

  ingress {
    
    from_port   = 80
    to_port     = 80
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
    Name = "sg_public_${module.shared_vars.env_suffix}"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "sg_private_${module.shared_vars.env_suffix}"
  description = "public_loadbanalncer_${module.shared_vars.env_suffix}"
  vpc_id      = "${module.shared_vars.vpcid}"

  ingress {
    
    from_port   = 80
    to_port     = 80
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
    Name = "sg_public_${module.shared_vars.env_suffix}"
  }
}