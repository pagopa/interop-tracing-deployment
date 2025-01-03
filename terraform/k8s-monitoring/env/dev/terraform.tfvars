aws_region = "eu-south-1"
env        = "dev"

tags = {
  CreatedBy   = "Terraform"
  Environment = "dev"
  Owner       = "PagoPA"
  Source      = "https://github.com/pagopa/interop-tracing-deployment"
}

eks_cluster_name = "tracing-eks-cluster-dev"

sns_topic_name = "tracing-platform-alarms-dev"

cloudwatch_log_group_name = "/aws/eks/tracing-eks-cluster-dev/application"