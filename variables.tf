variable "cidr_vpc" {
    description = "CIDR da VPC na AWS"
    type = string  
}

variable "cidr_subnet" {
    description = "CIDR da Subnet na AWS"
    type = string  
}

variable "environment" {
    description = "Ambiente dos recursos criados"
    type = string  
}

variable "route_table_igw" {
    description = "Tabela de rota para internet"
    type = string
    default = "0.0.0.0/0"  
}