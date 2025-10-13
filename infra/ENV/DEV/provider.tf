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
  subscription_id = "70d13209-b5da-483b-9f07-a91b9e1a684b"
}