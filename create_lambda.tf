
resource "aws_iam_role" "iam_lambda" {
  name = "iam_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "lambda_function" {
  filename      = "script.zip"
  function_name = "terraform_assignment"
  role          = aws_iam_role.iam_lambda.arn
  handler       = "export.py"

  runtime = "python3.8"

}