resource "aws_lambda_function" "function" {
  function_name = "${var.environment_name}-lambda"
  runtime       = "nodejs18.x"                # Runtime válido
  role          = var.role_arn               # ARN del rol de IAM necesario
  handler       = "index.handler"            # Handler de ejemplo
}