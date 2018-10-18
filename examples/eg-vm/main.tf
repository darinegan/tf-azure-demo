provider "azurerm" {}

resource "azurerm_resource_group" "test-rg" {
  name     = "test-rg"
  location = "westus2"
}
