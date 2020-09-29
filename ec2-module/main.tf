provider "aws"{
    region = "ap-south-1"
    profile = "lalchand-terraform"
}

module "ec2-module" {
    source = "./ec2_module"
    
}