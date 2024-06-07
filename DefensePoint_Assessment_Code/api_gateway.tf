resource "aws_api_gateway_rest_api" "api" {
  name        = "SPA_API"
  description = "API Gateway for SPA"
}

resource "aws_api_gateway_method" "get_method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_rest_api.api.root_resource_id
  http_method   = "GET"
  authorization = "NONE"
}

output "api_id" {
  value = aws_api_gateway_rest_api.api.id
}

output "root_resource_id" {
  value = aws_api_gateway_rest_api.api.root_resource_id
}

output "http_method" {
  value = aws_api_gateway_method.get_method.http_method
}

output "api_endpoint" {
  value = aws_api_gateway_rest_api.api.execution_arn
}
