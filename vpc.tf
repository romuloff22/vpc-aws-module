resource "aws_vpc" "vpc-homo" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "vpc-${var.environment}"
  }
}

resource "aws_subnet" "subnet-homo" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = var.cidr_subnet

  tags = {
    Name = "subnet01-${var.environment}"
  }
}

resource "aws_subnet" "subnet2-homo" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = var.cidr_subnet2

  tags = {
    Name = "subnet02-${var.environment}"
  }
}

resource "aws_subnet" "subnet3-homo" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = var.cidr_subnet3

  tags = {
    Name = "subnet03-${var.environment}"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc-homo.id

  tags = {
    Name = "internet-gateway-${var.environment}"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc-homo.id

  route {
    cidr_block = var.route_table_igw
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "route-table-${var.environment}"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet-homo.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.subnet2-homo.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "rta3" {
  subnet_id      = aws_subnet.subnet3-homo.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_security_group" "security_group" {
  name        = "seurit-group-${var.environment}"
  description = "Permitir acesso a porta 22"
  vpc_id      = aws_vpc.vpc-homo.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security-group-${var.environment}"
  }
}
