output "dns_name" {
    value = module.lb.load_balancer_addr
}