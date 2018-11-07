resource "azurerm_virtual_machine" "test-vm" {
  name                  = "test-vm"
  location              = "${azurerm_resource_group.test-rg.location}"
  resource_group_name   = "${azurerm_resource_group.test-rg.name}"
  network_interface_ids = ["${azurerm_network_interface.test-nic.id}"]
  vm_size               = "Standard_B2ms"

  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "test-vm-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = false
  }
}
