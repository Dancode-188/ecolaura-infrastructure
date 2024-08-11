resource "aws_db_subnet_group" "main" {
  name       = "ecolaura-db-subnet-group-${var.environment}"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "Ecolaura DB Subnet Group ${var.environment}"
  }
}

resource "aws_db_instance" "main" {
  identifier           = "ecolaura-db-${var.environment}"
  engine               = "postgres"
  engine_version       = "13.7"
  instance_class       = var.db_instance_class
  allocated_storage    = var.allocated_storage
  storage_type         = "gp2"
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  skip_final_snapshot  = true

  vpc_security_group_ids = [aws_security_group.db.id]

  tags = {
    Name = "ecolaura-db-${var.environment}"
  }
}

resource "aws_security_group" "db" {
  name        = "ecolaura-db-sg-${var.environment}"
  description = "Security group for database"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.web_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecolaura-db-sg-${var.environment}"
  }
}