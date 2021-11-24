terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }

  }

  required_version = ">= 0.14.9"
}

provider "cloudflare" {
  email   = "a-tim@ukr.net"
  api_key = "72f07e53b3edcdb44b59c5e61786b71a37ada"
}


provider "aws" {
  profile = "default"
  region  = "eu-central-1"
  access_key                  = "AKIA4FPGXF6BMMU5YJZU"
  
  secret_key                  = "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"
}


