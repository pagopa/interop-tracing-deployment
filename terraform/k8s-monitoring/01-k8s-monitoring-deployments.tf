data "aws_sns_topic" "platform_alarms" {
  name = var.sns_topic_name
}

data "local_file" "microservices_list" {
  filename = "${path.module}/assets/microservices-list.json"
}

locals {
  microservices_names = jsondecode(data.local_file.microservices_list.content)
}

module "k8s_deployment_monitoring" {
  for_each = toset(local.microservices_names)

  source = "git::https://github.com/pagopa/interop-infra-commons//terraform/modules/k8s-deployment-monitoring?ref=v1.3.5"

  env                 = var.env
  eks_cluster_name    = var.eks_cluster_name
  k8s_namespace       = var.env
  k8s_deployment_name = each.key
  sns_topics_arns     = [data.aws_sns_topic.platform_alarms.arn]

  create_pod_availability_alarm = true
  create_pod_readiness_alarm    = true
  create_performance_alarm      = true
  create_app_logs_errors_alarm  = true

  avg_cpu_alarm_threshold           = 70
  avg_memory_alarm_threshold        = 70
  performance_alarms_period_seconds = 300 # 5 minutes

  create_dashboard = true

  cloudwatch_app_logs_errors_metric_name      = contains(local.microservices_names, each.key) ? "ErrorCount" : null                #TOCHECK
  cloudwatch_app_logs_errors_metric_namespace = contains(local.microservices_names, each.key) ? "EKSApplicationLogsFilters" : null #TOCHECK
}