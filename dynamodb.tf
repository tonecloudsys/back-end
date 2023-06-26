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
    "primaryKey": {"S": "VisitorCounter"},
    "counterValue": {"N": "0"}
}
   
   ITEM
}



resource "aws_dynamodb_table" "counter-table" {
    name = "counter-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "CounterID"
   

    attribute {
        name = "CounterID"
        type = "S"
    }
 
    }

