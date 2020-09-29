provider "aws"{
    region = "ap-south-1"
    profile = "lalchand-terraform"
}

module "sg_module" {
    source = "./sg_module"
    
}

module "ec2-module_1" {
    sg_id = "${module.sg_module.sgid-output}"
    ec2_name = "EC2-instance from Module"
    source = "./ec2_module"
    
}

module "ec2-module_2" {
    sg_id = "${module.sg_module.sgid-output}"
    ec2_name = "EC2-instance from Module"
    source = "./ec2_module"
    
}