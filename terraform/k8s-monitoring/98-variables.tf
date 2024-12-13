variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "env" {
  type        = string
  description = "Environment name"
}

variable "tags" {
  type = map(any)
  default = {
    CreatedBy = "Terraform"
  }
}

variable "sso_admin_role_name" { #TOREMOVE
  type        = string
  description = "Name of the existing SSO admin role"
}

variable "eks_cluster_name" {
  type        = string
  description = "Name of the tracing EKS cluster"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic for alarms notifications"
  type        = string
}