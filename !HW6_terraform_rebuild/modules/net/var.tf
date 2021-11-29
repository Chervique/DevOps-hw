output "public_id" {
    value = aws_subnet.public.id
}

output "private_id" {
    value = aws_subnet.private.id
}

/////


variable "public_cidr_block" {
type = string
}
variable "private_cidr_block" {
type = string
}

variable "vpc_id" {
type = string
}
