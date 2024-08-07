variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "eu-central-1"
}

variable "github_oidc_provider_arn" {
  description = "OIDC provider ARN for GitHub Actions"
  type        = string
  default     = "arn:aws:iam::615677714887:oidc-provider/token.actions.githubusercontent.com"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-cluster"
}

variable "github_owner" {
  description = "GitHub owner"
  type        = string
  default     = "optiop"
}

variable "github_repo" {
  description = "GitHub repository"
  type        = string
  default     = "kubernetes-go-boilerplate"
}

variable "stage" {
  description = "Stage of the deployment"
  type        = string
  default     = "dev"
}
