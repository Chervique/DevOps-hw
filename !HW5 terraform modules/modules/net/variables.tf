variable "cidr_block" {
    type    = string
    default =  "10.0.0.0/16"
}

variable "vpc_id" {
    type    = string
    default =  "aws_vpc.main.id"
}

variable "public_subnet_cidr" {
    type    = list(string)
    default = ["10.0.1.0/24","10.0.2.0/24"]
}




variable "privat_subnet_cidr" {
    type    = list 
    default = ["10.0.3.0/24","10.0.4.0/24"]
}



variable "number_of_AZ" {
    default = 2
}

variable "zones" {
    type    = list 
    default = ["eu-central-1a","eu-central-1b"]
}