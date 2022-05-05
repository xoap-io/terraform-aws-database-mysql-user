terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.8.0"
    }
    mysql = {
      source  = "winebarrel/mysql"
      version = ">=1.9.0-p8"
    }
  }
  required_version = ">=1.1.6"
}
