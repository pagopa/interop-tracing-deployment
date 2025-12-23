aws_region = "eu-south-1"
env        = "prod"

tags = {
  CreatedBy   = "Terraform"
  Environment = "prod"
  Owner       = "PagoPA"
  Source      = "https://github.com/pagopa/interop-tracing-deployment"
}

eks_cluster_name = "tracing-eks-cluster-prod"
