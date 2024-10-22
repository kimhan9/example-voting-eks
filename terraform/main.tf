# VPC
module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "5.14.0"
  name                 = "voting-vpc"
  cidr                 = var.vpc_cidr
  azs                  = var.azs
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true
}

# EKS
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.26.0"

  cluster_name    = "voting-cluster"
  cluster_version = "1.31"
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    one = {
      name           = "node-group-1"
      instance_types = ["t3.small"]
      capacity_type  = "SPOT"

      min_size     = 2
      max_size     = 10
      desired_size = 2
    }

    two = {
      name           = "node-group-1"
      instance_types = ["t3.small"]
      capacity_type  = "SPOT"

      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
  }

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}

resource "aws_ecr_repository" "ecr" {
  name = "voting-ecr"
}