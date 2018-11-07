resource "azurerm_virtual_network" "test-network" {
  name                = "test-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.test-rg.location}"
  resource_group_name = "${azurerm_resource_group.test-rg.name}"
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.test-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.test-network.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_public_ip" "test-fen-ip" {
  name                         = "test-fen-ip"
  location                     = "${azurerm_resource_group.test-rg.location}"
  resource_group_name          = "${azurerm_resource_group.test-rg.name}"
  public_ip_address_allocation = "static"
}

resource "azurerm_network_interface" "test-nic" {
  name                = "test-nic"
  location            = "${azurerm_resource_group.test-rg.location}"
  resource_group_name = "${azurerm_resource_group.test-rg.name}"

  network_security_group_id = "${azurerm_network_security_group.test-nsg.id}"

  ip_configuration {
    name                          = "test-config"
    subnet_id                     = "${azurerm_subnet.internal.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.test-fen-ip.id}"
  }
}
