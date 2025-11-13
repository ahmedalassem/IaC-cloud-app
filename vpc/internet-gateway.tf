resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = var.internet_gateway
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}