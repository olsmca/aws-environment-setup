variable "environment_name" {
  type = string
}

variable "s3_bucket_name" {
  type        = string
  description = "El nombre del bucket S3 usado por la función Lambda."
}

variable "s3_bucket_arn" {
  type        = string
  description = "El ARN del bucket S3 usado por la función Lambda."
}

variable "s3_key" {
  description = "The S3 key for the Lambda function code"
  type        = string
}

variable "role_arn" {
  description = "The Role arn for the Lambda function code"
  type        = string
}