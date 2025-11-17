data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

resource "aws_launch_template" "ubuntu_nodes" {
  name_prefix   = "${var.cluster_name}-ubuntu-ng-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.node_instance_type

  vpc_security_group_ids = [aws_security_group.cluster.id]

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
      volume_type = "gp3"
      encrypted   = true
    }
  }

  user_data = base64encode(<<-EOT
              #!/bin/bash
              set -xe
              /etc/eks/bootstrap.sh ${aws_eks_cluster.main.name} \
                --apiserver-endpoint ${aws_eks_cluster.main.endpoint} \
                --b64-cluster-ca ${aws_eks_cluster.main.certificate_authority[0].data}
              EOT
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.cluster_name}-ubuntu-node"
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name        = "${var.cluster_name}-ubuntu-node"
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_eks_node_group" "ubuntu_nodes" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.cluster_name}-ubuntu-ng"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.node_desired_size
    max_size     = var.node_max_size
    min_size     = var.node_min_size
  }

  ami_type       = "CUSTOM"
  capacity_type  = "ON_DEMAND"
  instance_types = [var.node_instance_type]

  launch_template {
    id      = aws_launch_template.ubuntu_nodes.id
    version = "$Latest"
  }

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
    aws_launch_template.ubuntu_nodes,
    aws_eks_cluster.main
  ]
}

