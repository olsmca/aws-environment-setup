resource "aws_cognito_user_pool" "user_pool" {
  name = "${var.environment_name}-user-pool"
}

output "user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}
