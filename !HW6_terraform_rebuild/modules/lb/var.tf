variable "lb_sec_groups" {
 type = list(string)
}
 
variable "lb_subnets" {
    type = list(string)
}

variable "vpc_id" {
    type = string
}

variable "nginx1_id" {
    type = string
}
variable "nginx2_id" {
    type = string
}
variable "phpmyadmin_id" {
type = string
}

output "load_balancer_addr" {
  description = "LB adress for CLoudflare CNAME"
  value       = aws_lb.lb.dns_name
} 