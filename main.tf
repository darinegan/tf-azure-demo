provider "azurerm" {}

resource "azurerm_resource_group" "foo" {
  name     = "foo"
  location = "West US"
}
