output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "cloudfront_distribution_id" {
  value = module.cloudfront.distribution_id
}

output "api_gateway_url" {
  value = module.api_gateway.api_endpoint
}

output "lambda_function_name" {
  value = module.lambda.function_name
}
