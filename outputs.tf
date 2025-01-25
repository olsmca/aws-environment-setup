output "api_gateway_url" {
  value       = module.api_gateway.url
  description = "URL del API Gateway"
}

output "cognito_user_pool_id" {
  value       = module.cognito.user_pool_id
  description = "ID del User Pool de Cognito"
}



output "sqs_queue_url" {
  value       = module.sqs.queue_url
  description = "URL de la cola SQS"
}

output "s3_bucket_name" {
  value       = module.s3.bucket_name
  description = "Nombre del bucket S3"
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}