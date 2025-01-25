variable "environment_name" {
  type = string
}

variable "services_enabled" {
  type        = list(string)
  description = "List of enabled services (e.g., API Gateway, Lambda, S3, SQS)"
}
