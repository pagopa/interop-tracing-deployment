aws_region = "eu-south-1"
env        = "uat"

tags = {
  CreatedBy   = "Terraform"
  Environment = "uat"
  Owner       = "PagoPA"
  Source      = "https://github.com/pagopa/interop-tracing-deployment"
}

eks_cluster_name = "tracing-eks-cluster-uat"

sns_topic_name = "tracing-platform-alarms-uat"

cloudwatch_log_group_name = "/aws/eks/tracing-eks-cluster-uat/application"
