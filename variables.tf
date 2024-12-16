variable "environment_name" {
  description = "Nombre del ambiente (dev, staging, prod)"
}

variable "aws_region" {
  description = "Región de AWS"
  default     = "us-east-1"
}

variable "enable_api_gateway" {
  description = "Habilitar API Gateway"
  type        = bool
  default     = false
}

variable "enable_cognito" {
  description = "Habilitar Cognito"
  type        = bool
  default     = false
}

variable "enable_lambda" {
  description = "Habilitar Lambda"
  type        = bool
  default     = false
}

variable "enable_sqs" {
  description = "Habilitar SQS"
  type        = bool
  default     = false
}

variable "enable_s3" {
  description = "Habilitar S3"
  type        = bool
  default     = false
}
