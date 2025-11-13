resource "aws_eip" "nat_a" {
  domain = "vpc"

  tags = {
    Name        = "${var.vpc_name}-nat-a-eip"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_nat_gateway" "main_nat_a_gateway" {
  allocation_id = aws_eip.nat_a.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name        = "${var.vpc_name}-natgw-a"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
  depends_on = [aws_internet_gateway.gateway]
}

