data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  # Use the first two available AZs in the region for multi-AZ deployment
  availability_zones = data.aws_availability_zones.available.names
}

