terraform {
    backend "s3" {
        bucket = "672009997609-terraform-state"
        key = "common-infrastructure/sns-topics/terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws"{
    region = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "aws_sns_topic" "sec-api-data-service-companies-to-process" {
  name = "Sec-Api-Data-Service-Companies-To-Process"
  display_name = "Sec-Api-Data-Service-Companies-To-Process"
}