terraform {
  required_version = "=1.4.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.53.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}