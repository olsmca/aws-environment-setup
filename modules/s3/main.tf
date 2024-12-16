resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment_name}-bucket"
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}
