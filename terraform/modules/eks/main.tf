provider "aws" {
  region = "us-west-2"
}

# Fetch the default VPC
data "aws_vpc" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

# Fetch all subnets in the default VPC
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Fetch the default VPC
data "aws_vpc" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

# Fetch all subnets in the default VPC
data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Fetch route tables associated with the default VPC
data "aws_route_tables" "default_route_tables" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Identify public subnets
locals {
  public_subnets = [
    for subnet_id in data.aws_subnets.default_subnets.ids :
    subnet_id if length([
      for route_table in data.aws_route_tables.default_route_tables.ids :
      route_table if length([
        for route in aws_route_table.route_table.route :
        route if route.gateway_id != null
      ]) > 0
    ]) > 0
  ]
}

# Add tags to public subnets
resource "aws_subnet_tag" "public_subnet_tags" {
  for_each = toset(local.public_subnets)

  subnet_id = each.key

  tags = {
    "kubernetes.io/role/elb" = "1" # Tag for public subnets used by ALB
  }
}

resource "aws_eks_cluster" "my_eks" {
  name     = "my-eks-cluster"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = aws_subnet.eks_subnet[*].id
  }
}

# Ensure to add roles for EKS cluster and nodes
resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role" "eks_node" {
  name = "eks-node-role"
  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  })
}

