resource "aws_dynamodb_table" "resume-counter-table" {
   
   lifecycle {
    ignore_changes = [
        item,
    ]
   }
    table_name = "ResumeCounter"
}