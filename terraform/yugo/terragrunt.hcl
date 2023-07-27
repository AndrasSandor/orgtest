generate "provider" {
  path      = "provider.tf"
  if_exists = "skip"
  contents  = <<EOF
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.70.0"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-1"
  }
EOF
}


# Configure Terragrunt to store state in S3 bucket
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "yugo-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt        = true
  }
}