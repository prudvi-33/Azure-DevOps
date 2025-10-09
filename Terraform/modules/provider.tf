terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"  # Fixed specific version
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  # Service Principal Authentication
  // client_id       = var.client_id
  // client_secret   = var.client_secret
  // tenant_id       = var.tenant_id
  subscription_id           = var.subscription_id
}

provider "azurerm" {
  alias           = "aks_specific"
  features {}
  skip_provider_registration = true
  # Service Principal Authentication
  // client_id       = var.client_id
  // client_secret   = var.client_secret
  // tenant_id       = var.tenant_id
  subscription_id           = var.subscription_id
}

provider "azapi" {
  # Uses same authentication as azurerm provider
  # Service Principal Authentication
  // client_id       = var.client_id
  // client_secret   = var.client_secret
  // tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  use_msi = false  # Add this line to prevent Managed Identity authentication
}
