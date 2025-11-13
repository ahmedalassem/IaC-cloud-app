resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main_nat_a_gateway.id
  }

  tags = {
    Name        = "${var.vpc_name}-private-rt-a"
    Project     = var.project_name
    Environment = var.environment
    Tier        = "private"
    ManagedBy   = "Terraform"
  }
}
