resource "aws_api_gateway_rest_api" "api" {
    name = "cloud-resume-challenge-counter-api"
}

resource "aws_api_gateway_resource" "resource" {
    path_part   = "counter"
    parent_id   = aws_api_gateway_rest_api.api.root_resource_id
    rest_api_id = aws_api_gateway_rest_api.api.id
}

resource "aws_api_gateway_method" "method" {
    rest_api_id     = aws_api_gateway_rest_api.api.id
    resource_id     = aws_api_gateway_resource.resource.id
    http_method     = "ANY"
    authorization   = "NONE"
}

resource "aws_api_gateway_integration" "apigw-integration" {
    rest_api_id             = aws_api_gateway_rest_api.api.id
    resource_id             = aws_api_gateway_resource.resource.id
    http_method             = aws_api_gateway_method.method.http_method
    integration_http_method = "POST"
    type                    = "AWS_PROXY"
    url                     = aws_lambda_function.lambda-get-function.invoke_arn

}

resource "aws_api_gateway_deployment" "apigw-deployment" {
    depends_on = [
        aws_api_gateway_integration.apigw-integration,
 ]

 rest_api_id = aws_api_gateway_rest_api.api.id
 stage_name = "cloud-resume-challenge"
}

resource "aws_api_gateway_method_settings" "apigw-settings" {
    rest_api_id     = aws_api_gateway_rest_api.api.id
    stage_name      = aws_api_gateway_deployment.apigw-deployment.stage_name
    method_path     = "${aws_api_gateway_resource.resource.path_part}/*"

    settings {
        metrics_enabled = true
        logging_level   = "INFO"
    }
}