resource "azurerm_security_center_contact" "main" {
  email = var.alert_email
  alert_notifications = true
  alerts_to_admins = true
}
resource "azurerm_security_center_subscription_pricing" "virtual_machines" {
  tier = "Standard"
  resource_type = "VirtualMachines"
}
resource "azurerm_security_center_subscription_pricing" "storage" {
  tier = "Standard"
  resource_type = "StorageAccounts"
}
