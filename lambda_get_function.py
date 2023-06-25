import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("counter-table")

def lambda_handler(event, context):
    body = 'Provide "counter_id" as a query parameter.'
    counter_id = event.get("queryStringParameters").get("counter_id")

    if (
        event.get("path") == "/counter"
        and event.get("httpMethod") == "GET"
        and counter_id
    ):
        response = table.get_item(Key={"CounterID": counter_id})
        
        body = response["Item"]["NumberOfHits"] if ("ITEM" in response) else 0

    return {
        "headers": {"Access-Control-Allow-Origin": "*"},
        "statusCode": 200,
        "body": f"{body}",
    }