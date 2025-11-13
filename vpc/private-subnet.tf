resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_a_cidr
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = false

  tags = {
    Name        = var.prv_subnet_a
    Project     = var.project_name
    Environment = var.environment
    Tier        = "private"
    ManagedBy   = "Terraform"
  }
}

