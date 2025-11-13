variable "region" {
  description = "AWS region "
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Project name or the tag of the resource"
  type        = string
  default     = "Kubernetes-project"
}

variable "vpc_name" {
  description = " the name of vpc"
  type        = string
  default     = "Main-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "pub_subnet_a" {
  description = "tag for the availability_zone a public subnet"
  type        = string
  default     = "public-subnet-a"
}

variable "prv_subnet_a" {
  description = "tag for the availability_zone a private subnet"
  type        = string
  default     = "private-subnet-a"
}

variable "public_subnet_a_cidr" {
  description = "CIDR block for public subnet A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_a_cidr" {
  description = "CIDR block for private subnet A"
  type        = string
  default     = "10.0.2.0/24"
}

variable "internet_gateway" {
  description = "internet gateway description"
  type        = string
  default     = "main-internet-gateway"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
    description = "s3 bucket name"
    type = string
    default = "main_s3_bucket"
}