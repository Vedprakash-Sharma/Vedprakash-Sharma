terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.107.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "sunita"
    storage_account_name = "sunitastorage"
    container_name       = "sunitacontainer"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}