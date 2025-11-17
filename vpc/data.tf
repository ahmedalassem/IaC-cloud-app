# Get the first availability zone in the region for single AZ deployment
data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  # Use the first available AZ in the region
  availability_zone = data.aws_availability_zones.available.names[0]
}

