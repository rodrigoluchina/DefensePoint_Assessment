resource "aws_lambda_function" "spa_lambda" {
  filename         = "lambda_function.zip"
  function_name    = "SPAHandler"
  role             = module.iam.lambda_exec_role_arn
  handler          = "index.handler"
  runtime          = "nodejs14.x"
  source_code_hash = filebase64sha256("lambda_function.zip")
}

output "lambda_invoke_arn" {
  value = aws_lambda_function.spa_lambda.invoke_arn
}

output "function_name" {
  value = aws_lambda_function.spa_lambda.function_name
}
