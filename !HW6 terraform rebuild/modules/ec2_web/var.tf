variable "vpc_id" {
type = string
}

variable "subnet_id" {
    type = string
}

variable "zones" {
    type = list(string)
    default = ["eu-central-1a","eu-central-1b","eu-central-1b"]
}

variable "ami" {
type = string
default     = "ami-0a49b025fffbbdac6"
}

variable "user_data" {
    type = string
}

variable "instance_type" {
type = string
default = "t2.micro"
}

variable "webserver_name" {
type = string
}

variable "sec_groups" {
type = list(string)
}

output "instance_id" {
    value = aws_instance.webserver.id
}