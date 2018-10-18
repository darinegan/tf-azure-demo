resource "azurerm_network_security_group" "test-nsg" {
  name                = "test-nsg"
  location            = "${azurerm_resource_group.test-rg.location}"
  resource_group_name = "${azurerm_resource_group.test-rg.name}"
}

resource "azurerm_network_security_rule" "rule-allow-rdp" {
  name                        = "Allow-In-TCP-3389"
  resource_group_name         = "${azurerm_resource_group.test-rg.name}"
  network_security_group_name = "${azurerm_network_security_group.test-nsg.name}"
  priority                    = 110
  access                      = "Allow"
  direction                   = "Inbound"
  protocol                    = "Tcp"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_address_prefix  = "*"
  destination_port_range      = "3389"
}
