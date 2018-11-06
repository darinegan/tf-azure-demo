provider "azurerm" {}

resource "azurerm_resource_group" "rg" {
  name     = "${var.name}"
  location = "${var.location}"
}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.sa_name}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${azurerm_resource_group.rg.location}"
  account_tier             = "${var.sa_tier}"
  account_replication_type = "${var.sa_replication_type}"
}

resource "azurerm_storage_container" "cntnr" {
  name                  = "${var.sa_cntnr_name}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  storage_account_name  = "${azurerm_storage_account.sa.name}"
  container_access_type = "private"
}
