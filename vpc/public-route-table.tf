resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name        = "${var.vpc_name}-public-rt"
    Project     = var.project_name
    Environment = var.environment
    Tier        = "public"
    ManagedBy   = "Terraform"
  }
}
