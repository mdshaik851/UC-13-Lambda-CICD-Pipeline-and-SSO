
# Configure the AWS Provider
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1" # Mumbai region
}


locals {
  project_name = "HelloWorldApp"
  environment  = "dev"
}

module "cognito" {
  source = "./modules/cognito"

  project_name = local.project_name
  environment  = local.environment
}

module "lambda" {
  source = "./modules/lambda"

  project_name = local.project_name
  environment  = local.environment
}


module "api_gateway" {
  source = "./modules/api_gateway"

  project_name        = local.project_name
  environment         = local.environment
  lambda_function_arn = module.lambda.lambda_function_arn
  cognito_user_pool_arn = module.cognito.user_pool_arn
}
