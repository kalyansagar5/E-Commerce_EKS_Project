terraform {
  required_version = ">= 1.6.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.25.0"
    }

    tls = {
      source = "hashicorp/tls"
    }
  }

  backend "s3" {
    bucket = "arumullaaluruu321"
    key    = "k8/terraform.tfstate"
    region = "us-east-1"
  }
}
