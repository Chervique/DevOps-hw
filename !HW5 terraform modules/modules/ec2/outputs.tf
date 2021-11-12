output "load_balancer_addr" {
  description = "LB adress for CLoudflare CNAME"
  value       = aws_lb.lb.dns_name
} 