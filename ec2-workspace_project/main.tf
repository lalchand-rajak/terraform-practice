provider "aws"{
    region = "ap-south-1"
    profile = "lalchand-terraform"
}

module "sg_module" {
    sg_name = "sg_ec2_${local.env}"
    source = "./sg_module"
    
}

#variable "amiid-output"{}

module "ec2-module_1" {
    sg_id = "${module.sg_module.sgid-output}"
    ec2ami = "${local.amiid}"
    ec2_name = "EC2-instance_${local.env}"
    source = "./ec2_module"
    
}

locals {
    env = "${terraform.workspace}"

  amiid_env = {
        default = "ami-09a7bbd08886aafdf"
        testing = "ami-09a7bbd08886aafdf"
        production = "ami-0cda377a1b884a1bc"
    }
    
    amiid = "${lookup(local.amiid_env,local.env)}"

    
}
output "amiid-output" {
        value = "${local.amiid}"
    }



