terraform {
    backend "s3" {
        bucket = "672009997609-terraform-state"
        key = "common-infrastructure/dynamo-tables/terraform.tfstate"
        region = "us-west-2"
    }
}

provider "aws"{
    region = "us-west-2"
}

data "aws_caller_identity" "current" {}

resource "aws_dynamodb_table" "sec-api-financial-data" {
    name           = "Sec-Api-Financial-Data"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "PartitionKey"
    range_key      = "SortKey"

    attribute {
        name = "PartitionKey"
        type = "S"
    }

    attribute {
        name = "SortKey"
        type = "S"
    }
}
