provider "azurerm" {}

resource "azurerm_resource_group" "tfstate-rg" {
  name     = "tfstate-rg"
  location = "westus"
}

resource "random_string" "sa-name" {
  length  = 24
  upper   = false
  number  = true
  special = false
}

resource "azurerm_storage_account" "tfstate-sa" {
  name                     = "${lower(random_string.sa-name.result)}"
  resource_group_name      = "${azurerm_resource_group.tfstate-rg.name}"
  location                 = "${azurerm_resource_group.tfstate-rg.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate-sa-cont" {
  name                  = "tfstate-sa-cont"
  resource_group_name   = "${azurerm_resource_group.tfstate-rg.name}"
  storage_account_name  = "${azurerm_storage_account.tfstate-sa.name}"
  container_access_type = "private"
}
