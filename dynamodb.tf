resource "aws_dynamodb_table" "table" {
  hash_key = "LockID"
  name = "terraform-statefile-locks"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}