output "load_balancer_addr" {
  description = "LB adress for CLoudflare CNAME"
  value       = module.ec2.load_balancer_addr
} 