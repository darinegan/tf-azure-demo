resource "azurerm_virtual_machine_extension" "test-vmext-VMAccessAgent" {
  count                = 0
  name                 = "test-vmext-VMAccessAgent"
  location             = "${azurerm_resource_group.test-rg.location}"
  resource_group_name  = "${azurerm_resource_group.test-rg.name}"
  virtual_machine_name = "${azurerm_virtual_machine.test-vm.name}"
  publisher            = "Microsoft.Compute"
  type                 = "VMAccessAgent"
  type_handler_version = "2.4"
  settings             = ""
}

resource "azurerm_virtual_machine_extension" "test-vmext-IaaSAntimalware" {
  name                 = "test-vmext-IaaSAntimalware"
  location             = "${azurerm_resource_group.test-rg.location}"
  resource_group_name  = "${azurerm_resource_group.test-rg.name}"
  virtual_machine_name = "${azurerm_virtual_machine.test-vm.name}"
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.5"

  settings = <<SETTINGS
{
  "AntimalwareEnabled": "true",
  "Exclusions": {
  },

  "RealtimeProtectionEnabled": "true",
  "ScheduledScanSettings": {
    "isEnabled": "true",
    "scanType": "Quick",
    "day": "7",
    "time": "120"
  }
}
SETTINGS
}

# ------------------------------------------------------------------------------
# This extension's settings need to be specified.
# Therefore, this resource is explicitly disabled.
# This is achieved by assigning the meta-parameter "count" to zero.
# ------------------------------------------------------------------------------
resource "azurerm_virtual_machine_extension" "test-vmext-MicrosoftMonitoringAgent" {
  count                = 0
  name                 = "test-vmext-MicrosoftMonitoringAgent"
  location             = "${azurerm_resource_group.test-rg.location}"
  resource_group_name  = "${azurerm_resource_group.test-rg.name}"
  virtual_machine_name = "${azurerm_virtual_machine.test-vm.name}"
  publisher            = "Microsoft.EnterpriseCloud.Monitoring"
  type                 = "MicrosoftMonitoringAgent"
  type_handler_version = "1.0"

  settings = <<SETTINGS
{
  "workspaceId": "myWorkSpaceId"
}
SETTINGS

  protected_settings = <<PROTECTEDSETTINGS
{
  "workspaceKey": "myWorkspaceKey"
}
PROTECTEDSETTINGS
}

# ------------------------------------------------------------------------------
# This extension's settings need to be specified.
# Therefore, this resource is explicitly disabled.
# This is achieved by assigning the meta-parameter "count" to zero.
# ------------------------------------------------------------------------------
resource "azurerm_virtual_machine_extension" "test-vmext-QualysAgent" {
  count                = 0
  name                 = "test-vmext-QualysAgent"
  location             = "${azurerm_resource_group.test-rg.location}"
  resource_group_name  = "${azurerm_resource_group.test-rg.name}"
  virtual_machine_name = "${azurerm_virtual_machine.test-vm.name}"
  publisher            = "Qualys"
  type                 = "QualysAgent"
  type_handler_version = "1.6"

  settings = <<SETTINGS
{
}
SETTINGS
}
