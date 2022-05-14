resource "aws_dynamodb_table" "locks" {
    hash_key = "LockID"
    name = "${data.aws_caller_identity.current.account_id}-terraform-locks"

    billing_mode = "PAY_PER_REQUEST"
    attribute {
        name = "LockID"
        type = "S"
    }

    point_in_time_recovery{
        enabled = true
    }
}