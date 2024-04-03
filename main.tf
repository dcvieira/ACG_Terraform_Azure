terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "DgoLabDevOpsCloud"
    workspaces {
      name = "acg_remotestate"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "cguru-tf-rg"
  location = "Central US"
}

resource "azurerm_resource_group" "rg" {
  name     = "cguru-tf-rg2"
  location = "Central US"
}

resource "azurerm_storage_account" "storage" {
  name                     = "stgcguru"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}
