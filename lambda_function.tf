#Zip lambda function code
data "archive_file" "lambda_function_zip" {
    type        = "zip"
    output_path = "C:\\Users\\tone.herndon\\Git\\back-end\\lambda-get.zip"
    source_dir  = "C:\\Users\\tone.herndon\\Git\\back-end\\lambda_get_function.py"
}

resource "aws_lambda_function" "lambda_python" {
    function_name = "lambda_function_python"
    role          = aws_iam_role.lambda_role.arn
    handler       = "lambda_function_python.lambda_handler"
    runtime       = "3.9"
    filename      = data.archive_file.lambda_function_zip.output_path
    source_code_hash = data.archive_file.lambda_function_zip.output_base64sha256
}

#Define Lambda function IAM Role
resource "aws_iam_role" "lambda_role"


