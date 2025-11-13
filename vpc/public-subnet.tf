resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_a_cidr
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = var.pub_subnet_a
    Project     = var.project_name
    Environment = var.environment
    Tier        = "public"
    ManagedBy   = "Terraform"
  }
}