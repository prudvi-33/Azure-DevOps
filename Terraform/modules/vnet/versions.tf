terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.38.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.1"
    }
  }
}
