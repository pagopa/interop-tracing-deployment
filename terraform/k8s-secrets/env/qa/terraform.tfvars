aws_region = "eu-south-1"
env        = "qa"

tags = {
  CreatedBy   = "Terraform"
  Environment = "QA"
  Owner       = "PagoPA"
  Source      = "https://github.com/pagopa/interop-tracing-deployment"
}

eks_cluster_name = "tracing-eks-cluster-qa"
