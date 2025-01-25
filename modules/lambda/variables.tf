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
  description = "Clave del archivo zip con el código de la Lambda en el bucket S3"
  type        = string
}