resource "aws_dynamodb_table" "name" {
name = "${var.my-env}-meri-lolli-table"
billing_mode = "PAY_PER_REQUEST"
hash_key = "id"
attribute {
  name ="id"
  type = "S"
  
}
}