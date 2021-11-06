/* 
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}
*/
output "load_balancer_addr" {
  description = "LB adress for CLoudflare CNAME"
  value       = aws_lb.lb.dns_name
} 