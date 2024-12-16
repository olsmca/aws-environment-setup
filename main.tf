provider "aws" {
  region = var.aws_region
}

# Módulos
module "api_gateway" {
  source            = "./modules/api_gateway"
  enabled           = var.enable_api_gateway
  environment_name  = var.environment_name
}

module "cognito" {
  source            = "./modules/cognito"
  enabled           = var.enable_cognito
  environment_name  = var.environment_name
}

module "lambda" {
  source            = "./modules/lambda"
  enabled           = var.enable_lambda
  environment_name  = var.environment_name
}

module "sqs" {
  source            = "./modules/sqs"
  enabled           = var.enable_sqs
  environment_name  = var.environment_name
}

module "s3" {
  source            = "./modules/s3"
  enabled           = var.enable_s3
  environment_name  = var.environment_name
}
