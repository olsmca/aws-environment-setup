resource "aws_api_gateway_rest_api" "api" {
  name = "${var.environment_name}-api-gateway"
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "resource"
}

output "url" {
  value = aws_api_gateway_rest_api.api.execution_arn
}
