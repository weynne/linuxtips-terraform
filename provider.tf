terraform {
backend "s3" {
    bucket = "descomplicando-terraform-weynne"
    key    = "aula_backend"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "sa-east-1"
}
