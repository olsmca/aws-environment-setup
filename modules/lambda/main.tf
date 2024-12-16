resource "aws_lambda_function" "function" {
  function_name = "${var.environment_name}-lambda"
  runtime       = "nodejs18.x"
  role          = aws_iam_role.lambda_role.arn
  handler       = "handler.handler"

  s3_bucket = var.s3_bucket
  s3_key    = var.s3_key
}

resource "aws_iam_role" "lambda_role" {
  name = "${var.environment_name}-lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = { Service = "lambda.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}
