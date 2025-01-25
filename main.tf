provider "aws" {
  region = var.aws_region
}

# Módulos
module "api_gateway" {
  source           = "./modules/api_gateway"
  environment_name = var.environment_name
}

module "cognito" {
  source           = "./modules/cognito"
  environment_name = var.environment_name
}

module "lambda" {
  source           = "./modules/lambda"
  s3_bucket_name   = module.s3.bucket_name
  s3_bucket_arn    = module.s3.bucket_arn
  environment_name = var.environment_name
  role_arn         = module.iam.lambda_role_arn
  s3_key           = var.s3_key
}

module "sqs" {
  source           = "./modules/sqs"
  environment_name = var.environment_name
}

module "s3" {
  source           = "./modules/s3"
  environment_name = var.environment_name
  s3_key           = var.s3_key
}

module "iam" {
  source           = "./modules/iam"
  environment_name = var.environment_name
}


