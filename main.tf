terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"

    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraformStateRG"
    storage_account_name = "terraformstfl"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}


resource "azurerm_resource_group" "rg" {
  name     = "moe-tes-grp"
  location = "uaenorth"
}
 