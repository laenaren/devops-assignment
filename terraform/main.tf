variable "region" {
  type    = string
  default = "eu-west-1"
}

provider "aws" {
  region     = var.region
  access_key = "my-access-key"
  secret_key = "my-secret"
}

terraform {}


# create docker repo
module "ecr" {
  source = "./modules/ecr"
}


# create k8s cluster
module "eks" {
  source = "./modules/eks"
}