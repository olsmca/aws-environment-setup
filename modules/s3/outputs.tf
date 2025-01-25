output "bucket_name" {
  value       = aws_s3_bucket.bucket.id
  description = "Nombre del bucket S3 creado."
}

output "bucket_arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "ARN del bucket S3 creado."
}