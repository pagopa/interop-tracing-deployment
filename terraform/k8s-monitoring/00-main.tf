terraform {
  required_version = "~> 1.8.0"

  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.46.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}

locals { #TOREMOVE
  project = "tracing"
}

data "aws_iam_role" "sso_admin" { #TOREMOVE
  name = var.sso_admin_role_name
}

data "aws_caller_identity" "current" {} #TOREMOVE