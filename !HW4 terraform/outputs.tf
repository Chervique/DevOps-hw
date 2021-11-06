/* 
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}
*/
output "load_balancer_name" {
  description = "Public IP address of the Phpmyadmin instance"
  value       = aws_lb.lb.dns_name
} 