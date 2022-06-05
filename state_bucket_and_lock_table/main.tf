terraform {
    required_providers {
        aws = "~> 3.20"
    }
}

provider "aws" {
    region = "us-west-2"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "tfstate" {
    bucket = "${data.aws_caller_identity.current.account_id}-terraform-state"
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
    bucket = aws_s3_bucket.tfstate.bucket

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}

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
