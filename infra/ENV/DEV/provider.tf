terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Your SUBSCRIPTION_ID goes here
  # subscription_id = "SUBSCRIPTION_ID"
}