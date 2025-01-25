provider "aws" {
  region = var.aws_region
}

# Módulos
/*module "api_gateway" {
  source           = "./modules/api_gateway"
  environment_name = var.environment_name
}

module "cognito" {
  source           = "./modules/cognito"
  environment_name = var.environment_name
}*/

module "lambda" {
  source           = "./modules/lambda"
  s3_bucket_name   = module.s3.bucket_name
  s3_bucket_arn    = module.s3.bucket_arn
  environment_name = var.environment_name
}
/*
module "sqs" {
  source           = "./modules/sqs"
  environment_name = var.environment_name
}*/

module "s3" {
  source           = "./modules/s3"
  environment_name = var.environment_name
}
/*
module "iam" {
  source           = "./modules/iam"
  environment_name = var.environment_name
  services_enabled = var.services_enabled
}

resource "aws_cognito_identity_pool_roles_attachment" "identity_pool_roles" {
  identity_pool_id = aws_cognito_identity_pool.identity_pool.id

  roles = {
    authenticated   = module.iam.cognito_role_arn
    unauthenticated = module.iam.cognito_role_arn
  }
}*/