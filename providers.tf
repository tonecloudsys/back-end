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
    alias = "use1"
}

locals {
    account_id  = "44886408-4031-7010-7a27-0d8c4952c206"
    region      = "us-east-1"
    root_domain_name = "resume.toneherndon.com"
    cv_domain_name = "cv.${local.root_domain_name}"
}