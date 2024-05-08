output "subnet3_id" {
  description = "Id da Subnet 03"
  value = aws_subnet.subnet03.id
}

output "subnet4_id" {
  description = "Id da Subnet 04"
  value       = aws_subnet.subnet04.id
}

output "subnet5_id" {
  description = "Id da Subnet 05"
  value       = aws_subnet.subnet05.id
}

output "subnet6_id" {
  description = "Id da Subnet 06"
  value       = aws_subnet.subnet06.id
}

output "security_group02_id" {
  description = "ID do Security Group"
  value       = aws_security_group.security_group_02.id
}

output "security_group05_id" {
  description = "ID do Security Group"
  value       = aws_security_group.seurity_group_05.id
}

output "internet_gateway_id" {
  description = "ID do Internet gateway"
  value       = aws_internet_gateway.internet_gateway.id
}