terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.107.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
  backend "azurerm" {
    resource_group_name  = "sunita"
    storage_account_name = "sunitastorage"
    container_name       = "sunitacontainer"
    key                  = "development.terraform.tfstate"
  }

}
provider "azurerm" {
  features {}
}
provider "random" {}
