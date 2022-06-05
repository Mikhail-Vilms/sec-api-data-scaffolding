terraform {
    backend "s3" {
        bucket = "672009997609-terraform-state"
        key = "common-infrastructure/sns-topics/terraform.tfstate"
        region = "us-west-2"
    }
}

provider "aws"{
    region = "us-west-2"
}

data "aws_caller_identity" "current" {}

resource "aws_sns_topic" "sec-api-financial-statements-to-load" {
  name          = "Sec-Api-Financial-Statements-To-Load"
  display_name  = "Sec-Api-Financial-Statements-To-Load"
}

resource "aws_sns_topic" "sec-api-financial-positions-to-load" {
  name          = "Sec-Api-Financial-Positions-To-Load"
  display_name  = "Sec-Api-Financial-Positions-To-Load"
}
