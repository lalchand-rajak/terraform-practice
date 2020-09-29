provider "aws"{
    region = "ap-south-1"
    profile = "lalchand-terraform"
}

# this is string variable

variable "firststring"{
    type = "string"
    default = "this is my first string"
}

variable "Multilinestring"{
    type = "string"
    default = <<EOH
    this is a multilline
    string variable
    dated
    EOH
}

output "myfirstoutput"{
    value = "${var.firststring}"
}

output "outputmuilti"{
    value = "${var.Multilinestring}"
}

# map example variable


variable "mapexample"{
    type = "map"
    default = {
        "ap-south" = "ami:1"
        "ap-east"  = "ami:2"
    }
}

output "mapoutput"{
    value = "${var.mapexample["ap-east"]}"
}


# list variable exmaple


variable "listexample"{
    type = "list"
    default = ["sg1","sg2","sg3"]
}

output "outputlist"{
    #value = "${var.listexample[0]}"
    value = "${var.listexample}"
}

# boolean variable

variable "boolexample"{
    
    default = true
}

output "booloutput"{
    value = "${var.boolexample}"
}

### input variable

variable "myInputvariable"{
    type = "string"
}

output "myinputvar"{
    sensitive = true
    value = "${var.myInputvariable}"
}