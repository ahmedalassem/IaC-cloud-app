variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "kubernetes-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes version to use for the EKS cluster"
  type        = string
  default     = "1.31"
}

variable "vpc_id" {
  description = "VPC ID where the cluster will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "node_instance_type" {
  description = "Instance type for managed node group"
  type        = string
}

variable "node_desired_size" {
  description = "Desired capacity for managed node group"
  type        = number
}

variable "node_min_size" {
  description = "Minimum capacity for managed node group"
  type        = number
}

variable "node_max_size" {
  description = "Maximum capacity for managed node group"
  type        = number
}
