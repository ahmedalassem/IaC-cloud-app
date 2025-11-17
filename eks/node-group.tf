resource "aws_eks_node_group" "ubuntu_nodes" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.cluster_name}-ubuntu-ng"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids
  disk_size       = 20

  scaling_config {
    desired_size = var.node_desired_size
    max_size     = var.node_max_size
    min_size     = var.node_min_size
  }

  ami_type       = "AL2_x86_64"
  capacity_type  = "ON_DEMAND"
  instance_types = [var.node_instance_type]

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name        = "${var.cluster_name}-ubuntu-ng"
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_policy,
    aws_iam_role_policy_attachment.cni_policy,
    aws_iam_role_policy_attachment.ecr_read_only,
    aws_eks_cluster.main
  ]
}

