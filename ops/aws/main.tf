module "repository" {
  source = "./modules/repository"
  region = var.region
  name   = var.stage
  github_owner = var.github_owner
  github_repo = var.github_repo
  github_oidc_provider_arn = var.github_oidc_provider_arn
}

module "cluster" {
  source = "./modules/cluster"
  region = var.region
  cluster_name = var.cluster_name
  cluster_version = "1.30"
}