output "vpc_id" {
  value       = aws_vpc.main.id
} 



output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private
}

output "private_subnets_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private.*.id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public
}

output "public_subnets_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}