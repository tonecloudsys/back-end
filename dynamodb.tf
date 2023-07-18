resource "aws_dynamodb_table" "counter-table" {
    name = "counter-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "CounterID"
   read_capacity = 0
   write_capacity = 0

    attribute {
        name = "CounterID"
        type = "S"
    }
}

resource "aws_dynamodb_table_item" "counter-table" {
   
   lifecycle {
    ignore_changes = [
        item,
    ]
   }

   table_name = aws_dynamodb_table.counter-table.name
   hash_key = aws_dynamodb_table.counter-table.hash_key

   item = <<ITEM
{
    "CounterID" : {"S": "visits"},
    "count" : {"N": "0"}
}
ITEM
}


