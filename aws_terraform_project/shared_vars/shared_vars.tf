
output "vpcid" {
    value = "${local.vpcid}"
}

output "public_subnet" {
    value = "${local.public_subnet}"
}

output "private_subnet" {
    value = "${local.private_subnet}"
}

output "env_suffix" {
    value = "${local.env}"
}
locals {

    env = "${terraform.workspace}"

    vpc_id = {

        default = "vpc-552b283d"
        testing = "vpc-552b283d"
        production = "vpc-552b283d"
    }

    vpcid = "${lookup(local.vpc_id,local.env)}"

    public_subnet = {

        default = "subnet-cd5d75a5"
        testing = "subnet-cd5d75a5"
        production = "subnet-cd5d75a5"
    }

    public_subnet = "${lookup(local.public_subnet,local.env)}"

    private_subnet = {

        default = "subnet-4636a80a"
        testing = "subnet-4636a80a"
        production = "subnet-4636a80a"
    }

    private_subnet = "${lookup(local.private_subnet,local.env)}"
}