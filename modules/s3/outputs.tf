output "bucket_name" {
  description = "El nombre del bucket S3"
  value       = aws_s3_bucket.bucket.bucket
}

output "bucket_arn" {
  description = "El ARN del bucket S3"
  value       = aws_s3_bucket.bucket.arn
}