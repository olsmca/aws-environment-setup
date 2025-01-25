resource "aws_lambda_function" "function" {

  function_name = "${var.environment_name}-lambda"
  runtime       = "nodejs18.x"                # Runtime válido
  handler       = "index.handler"            # Handler de ejemplo
  role          = var.role_arn               # ARN del rol de IAM necesario
  s3_bucket     = var.s3_bucket_name         # Nombre del bucket S3
  s3_key        = var.s3_key                 # Key del bucket S3
  s3_object_version = "1"                    # Versión del objeto en S3
}