variable "environment_name" {
  description = "Nombre del ambiente (dev, staging, prod)"
  type        = string
}

variable "aws_region" {
  description = "Región de AWS"
  default     = "us-east-1"
}

variable "s3_key" {
  description = "The S3 key for the Lambda function code"
  type        = string
  default     = "source/index.js"
}