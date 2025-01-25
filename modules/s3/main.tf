resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment_name}-bucket"
}