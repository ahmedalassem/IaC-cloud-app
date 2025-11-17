resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_a_cidr
  availability_zone       = local.availability_zones[0]
  map_public_ip_on_launch = false

  tags = {
    Name        = var.prv_subnet_a
    Project     = var.project_name
    Environment = var.environment
    Tier        = "private"
    ManagedBy   = "Terraform"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_b_cidr
  availability_zone       = local.availability_zones[1]
  map_public_ip_on_launch = false

  tags = {
    Name        = var.prv_subnet_b
    Project     = var.project_name
    Environment = var.environment
    Tier        = "private"
    ManagedBy   = "Terraform"
  }
}

