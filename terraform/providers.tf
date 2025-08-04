terraform {
  required_version = ">= 1.3.0"
  # Leave as is — ensures we're using a modern Terraform version.

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
      # AWS provider pinned for stability.
    }
  }
}

provider "aws" {
  region = var.aws_region
  # Use region from variable input.
}
