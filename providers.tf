terraform {
    required_providers {
    aws = {
    source = "hashicorp/aws"
    version = "~> 5.0.1"
    }
    }
}

# Configure the AWS Provider
provider "aws" {
     version = "~> 5.0.1"
    region  =  local.region
    profile = "tone.herndon.adm"
}

provider "aws" {
     version = "~> 5.0.1"
    region = "us-east-1"
    profile = "tone.herndon.adm"
    alias = "use1"
}

locals {
    account_id  = "704953571715"
    region      = "us-east-1"
    root_domain_name = "resume.toneherndon.com"
  
}