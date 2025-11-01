terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.46"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=2.13.0"
    }
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}

provider "docker" {
  # Example configuration
  host = "unix:///var/run/docker.sock"  # For Linux/macOS
}
