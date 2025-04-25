terraform {
  backend "remote" {
    organization = "Ascendry" 
    workspaces { 
      name = "terraform-infra-harness-controller" 
    } 
  }
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.37.3"
    }
  }
}

provider "harness" {
  # Configuration options
  
}