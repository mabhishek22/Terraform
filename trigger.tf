

resource "aws_s3_bucket_notification" "my-trigger" {
  bucket = "assignment-terraform"

  lambda_function {
    lambda_function_arn = "terraform_assignment.lambda_function.arn"
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "AWSLogs/"
    filter_suffix       = ".txt"
  }
}

resource "aws_lambda_permission" "s3-lambda-permission" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = "terraform_assignment"
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::assignment-terraform"
}