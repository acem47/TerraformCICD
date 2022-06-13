provider "azurerm" {
	version = "~>2.5.0"
	features{}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraformStateRG.terraformStateRG.name"
    storage_account_name = "terraformstfl.terraformStateRG.name"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

variable "imagebuild" {
  type        = string
  description = "Latest Image Build"
}

resource "azurerm_resource_group" "dockerdevops" {
  name     = "dockerdevops"
  location = "UAE North"
}

resource "azurerm_container_group" "tfcg_test" {
  name                = "node-group-moe"
  location            = azurerm_resource_group.dockerdevops.location
  resource_group_name = azurerm_resource_group.dockerdevops.name

  ip_address_type = "public"
  dns_name_label  = "moe78"
  os_type         = "Linux"

  container {
    name   = "node-moe"
    image  = "moe78/nodetest:${var.imagebuild}"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
} 
