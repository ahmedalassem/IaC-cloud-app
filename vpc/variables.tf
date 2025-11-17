variable "project_name" {
  description = "Project name or the tag of the resource"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "vpc_name" {
  description = "The name of VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "pub_subnet_a" {
  description = "Tag for the availability_zone a public subnet"
  type        = string
}

variable "prv_subnet_a" {
  description = "Tag for the availability_zone a private subnet"
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "CIDR block for public subnet A"
  type        = string
}

variable "private_subnet_a_cidr" {
  description = "CIDR block for private subnet A"
  type        = string
}

variable "pub_subnet_b" {
  description = "Tag for the availability_zone b public subnet"
  type        = string
}

variable "prv_subnet_b" {
  description = "Tag for the availability_zone b private subnet"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for public subnet B"
  type        = string
}

variable "private_subnet_b_cidr" {
  description = "CIDR block for private subnet B"
  type        = string
}

variable "internet_gateway" {
  description = "Internet gateway description"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

