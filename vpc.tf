resource "aws_vpc" "vpc-homo" {
  cidr_block = var.cidr_vpc
  enable_dns_hostnames = true

  tags = {
    Name       = "vpc-${var.environment}"
    owner      = "romulo"
    managed-by = "terraform"
  }
}

resource "aws_subnet" "subnet01" {
  vpc_id            = aws_vpc.vpc-homo.id
  cidr_block        = var.cidr_subnet1
  availability_zone = "us-east-2a"

  tags = {
    Name = "subnet01-${var.environment}"
  }
}

resource "aws_subnet" "subnet02" {
  vpc_id            = aws_vpc.vpc-homo.id
  cidr_block        = var.cidr_subnet2
  availability_zone = "us-east-2b"

  tags = {
    Name = "subnet02-${var.environment}"
  }
}

resource "aws_subnet" "subnet03" {
  vpc_id            = aws_vpc.vpc-homo.id
  cidr_block        = var.cidr_subnet3
  availability_zone = "us-east-2c"

  tags = {
    Name       = "subnet03-${var.environment}"
    owner      = "romulo"
    managed-by = "terraform"
  }
}

resource "aws_subnet" "subnet04" {
  vpc_id            = aws_vpc.vpc-homo.id
  cidr_block        = var.cidr_subnet4
  availability_zone = "us-east-2a"

  tags = {
    Name       = "subnet04-prv-${var.environment}"
    owner      = "romulo"
    managed-by = "terraform"
  }
}

resource "aws_subnet" "subnet05" {
  vpc_id            = aws_vpc.vpc-homo.id
  cidr_block        = var.cidr_subnet5
  availability_zone = "us-east-2b"

  tags = {
    Name       = "subnet05-prv-${var.environment}"
    owner      = "romulo"
    managed-by = "terraform"
  }
}

resource "aws_subnet" "subnet06" {
  vpc_id            = aws_vpc.vpc-homo.id
  cidr_block        = var.cidr_subnet6
  availability_zone = "us-east-2c"

  tags = {
    Name       = "subnet06-prv-${var.environment}"
    owner      = "romulo"
    managed-by = "terraform"
  }
}


resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc-homo.id

  tags = {
    Name       = "internet-gateway-${var.environment}"
    owner      = "romulo"
    managed-by = "terraform"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc-homo.id

  route {
    cidr_block = var.route_table_igw
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name       = "route-table-${var.environment}"
    owner      = "romulo"
    managed-by = "terraform"
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
    from_port   = 443
    to_port     = 443
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
    Name       = "security-group02-${var.environment}"
    owner      = "romulo"
    managed-by = "terraform"
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
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = {
    Name       = "security-group05-${var.environment}"
    owner      = "romulo"
    managed-by = "terraform"
  }
}
