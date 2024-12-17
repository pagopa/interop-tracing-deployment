#!/bin/bash

# TOCHECK if use this and remove other checks
# set -e

# Choose one of the following ways to read the input
# 1)
# read input
# log_group_name=$(echo "$input" | jq -r '.log_group_name')

# 2)
eval "$(jq -r '@sh "log_group_name=\(.log_group_name)"')"

# Check if the input value is empty
if [[ -z "$log_group_name" ]]; then
  echo "Error: log_group_name is empty" >&2
  exit 1
fi

# Run the AWS command to get the metric filters as a JSON
response=$(aws logs describe-metric-filters --log-group-name "$log_group_name" --output json)

# Check the AWS command's exit code
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to retrieve metric filters" >&2
  exit 1
fi

# Extract the values of metricName and metricNamespace from the JSON
metric_name=$(echo "$response" | jq -r '.metricFilters[0].metricTransformations[0].metricName')
metric_namespace=$(echo "$response" | jq -r '.metricFilters[0].metricTransformations[0].metricNamespace')

# Check if the extracted values are empty
if [[ -z "$metric_name" || -z "$metric_namespace" ]]; then
  echo "Error: No metric filters found for the log group $log_group_name" >&2
  exit 1
fi

# Return a JSON containing extracted values
jq -n --arg metricName "$metric_name" --arg metricNamespace "$metric_namespace" '{metricName: $metricName, metricNamespace: $metricNamespace}'
