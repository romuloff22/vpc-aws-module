resource "aws_vpc" "vpc-homo" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "vpc-${var.environment}"
  }
}

resource "aws_subnet" "subnet01" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = var.cidr_subnet
  availability_zone = "us-east-2a"

  tags = {
    Name = "subnet01-${var.environment}"
  }
}

resource "aws_subnet" "subnet02" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = var.cidr_subnet2
  availability_zone = "us-east-2b"

  tags = {
    Name = "subnet02-${var.environment}"
  }
}

resource "aws_subnet" "subnet03" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = var.cidr_subnet3
  availability_zone = "us-east-2c"

  tags = {
    Name = "subnet03-${var.environment}"
  }
}

resource "aws_subnet" "subnet04" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = var.cidr_subnet4
  availability_zone = "us-east-2a"

  tags = {
    Name = "subnet04-prv-${var.environment}"
  }
}

resource "aws_subnet" "subnet05" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = var.cidr_subnet5
  availability_zone = "us-east-2b"

  tags = {
    Name = "subnet05-prv-${var.environment}"
  }
}

resource "aws_subnet" "subnet06" {
  vpc_id     = aws_vpc.vpc-homo.id
  cidr_block = var.cidr_subnet6
  availability_zone = "us-east-2c"

  tags = {
    Name = "subnet06-prv-${var.environment}"
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
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "rta3" {
  subnet_id      = aws_subnet.subnet03.id
  route_table_id = aws_route_table.route_table.id
}

/*resource "aws_security_group" "security_group" {
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
}*/

resource "aws_security_group" "security_group_01" {
  name        = "launch-wizard-1-${var.environment}"
  description = "Permitir acesso a porta 22, 80 e 443"
  vpc_id      = aws_vpc.vpc-homo.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
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

resource "aws_security_group" "security_group_02" {
  name        = "launch-wizard-2-${var.environment}"
  description = "Permitir acesso as portas customizadas"
  vpc_id      = aws_vpc.vpc-homo.id

  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["201.16.205.241/32"]
  }

  ingress {
    description = "Custom TCP"
    from_port   = 8001
    to_port     = 8001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom TCP"
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom TCP"
    from_port   = 8501
    to_port     = 8501
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom TCP"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom TCP"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom TCP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom TCP"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["177.55.225.74/32"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
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

resource "aws_security_group" "security_group_03" {
  name        = "launch-wizard-3-${var.environment}"
  description = "Permitir acesso a porta 22"
  vpc_id      = aws_vpc.vpc-homo.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security-group-${var.environment}"
  }
}

resource "aws_security_group" "security_group_04" {
  name        = "rds-qa-homo-${var.environment}"
  description = "Permitir acesso a porta 5432"
  vpc_id      = aws_vpc.vpc-homo.id

  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["186.206.254.117/32", "191.34.39.253/32", "172.31.29.21/32"]
  }
}

resource "aws_security_group" "seurity_group_05" {
  name        = "rds-launch-wizard-${var.environment}"
  description = "Permitir acesso a porta 5432"
  vpc_id      = aws_vpc.vpc-homo.id

  ingress {
    description = "MySQL/Aurora"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["201.17.157.23/32", "172.31.26.154/32", "172.31.28.100/32", "18.230.146.107/32", "172.31.18.102/32"]
  }

  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["177.42.94.34/32", "191.185.78.56/32", "172.31.26.154/32", "177.42.81.119/32", "191.34.39.253/32", "179.0.73.151/32", "187.111.26.6/32", "172.31.22.123/32", "186.206.255.44/32", "201.17.157.236/32", "179.184.192.19/32", "179.251.108.107/32", "191.35.59.48/32", "201.16.205.241/32", "172.31.29.21/32", "177.55.225.128/32", "187.72.246.105/32"]
  }

  tags = {
    Name = "security-group-${var.environment}"
  }
}
