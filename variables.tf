variable "environment_name" {
  description = "Nombre del ambiente (dev, staging, prod)"
  type = string
}

variable "aws_region" {
  description = "Región de AWS"
  default     = "us-east-1"
}