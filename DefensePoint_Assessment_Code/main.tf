provider "aws" {
  region = "us-west-2"
}

module "s3" {
  source = "./s3"
}

module "cloudfront" {
  source = "./cloudfront"
  s3_bucket_domain_name = module.s3.bucket_regional_domain_name
}

module "api_gateway" {
  source = "./api_gateway"
}

module "lambda" {
  source = "./lambda"
}

module "iam" {
  source = "./iam"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id = module.api_gateway.api_id
  resource_id = module.api_gateway.root_resource_id
  http_method = module.api_gateway.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri  = module.lambda.lambda_invoke_arn
}
