terraform {
    required_providers {
        aws = "~> 3.20"
    }
}

provider "aws" {
    region = "us-east-1"
}

data "aws_caller_identity" "current" {}
