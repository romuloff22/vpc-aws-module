output "subnet01_id" {
  description = "Id da Subnet 01"
  value       = aws_subnet.subnet01-homo.id
}

output "subnet02_id" {
  description = "Id da Subnet 02"
  value       = aws_subnet.subnet02-homo.id
}

output "subnet03_id" {
  description = "Id da Subnet 03"
  value       = aws_subnet.subnet03-homo.id
}


output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.security_group.id
}
