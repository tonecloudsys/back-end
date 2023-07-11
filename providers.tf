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
    region  =  "us-east-1"
    profile = "tone.herndon.adm"
}

provider "aws" {
    version = "~> 5.0.1"
    region = "us-east-1"
    alias = "use1"
}