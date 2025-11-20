terraform {
  backend "s3" {
    bucket = "assemsamirziad"
    key    = "terraform/state.tfstate"
    region = "eu-north-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.20"
    }
  }
}

provider "aws" {
  region = var.region
}
