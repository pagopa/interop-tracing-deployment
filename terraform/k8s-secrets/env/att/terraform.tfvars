aws_region = "eu-south-1"
env        = "att"

tags = {
  CreatedBy   = "Terraform"
  Environment = "att"
  Owner       = "PagoPA"
  Source      = "https://github.com/pagopa/interop-tracing-deployment"
}

eks_cluster_name = "tracing-eks-cluster-att"
