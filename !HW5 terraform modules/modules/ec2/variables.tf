
variable "ec2_ami" {
  description = ""
  type        = string
  default     = "ami-0a49b025fffbbdac6"
}

variable "ec2_instance_name" {
  type = list
  default = ["nginx1", "nginx2","phpmyadmin"]
}

variable "ec2_instance_type" {
  type        = string
  default = "t2.micro"
  
}

variable "ec2_key_name" {
    type    = string
    default = "AWS atym"
}

variable "ec2_iam_instance_profile" {
    type    = string
    default = "webserver"
}

variable "ec2_subnet_id" {
    type = list(string)
  default = ["aws_subnet.sn-1.id","aws_subnet.sn-1.id","aws_subnet.sn-2.id"]
}

variable "ec2_user_data" {
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "ec2_tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}





variable "instance_type" {
  type = list
  default = ["nginx", "nginx","phpmyadmin"]
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "ec2_vpc_id" {
    type    = string
    default = "aws_vpc.main.id"
}


variable "lb_dns_name" {
  type = string
  default = "aws_lb.lb.dns_name"
}


variable "instance_count" {
default = "3"

}