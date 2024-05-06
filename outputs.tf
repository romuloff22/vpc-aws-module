output "subnet_id" {
  description = "Id da Subnet 01"
  value       = aws_subnet.subnet-homo.id
}

output "subnet2_id" {
  description = "Id da Subnet 02"
  value       = aws_subnet.subnet2-homo.id
}

output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.security_group.id
}
