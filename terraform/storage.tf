resource "azurerm_storage_account" "security" {
  name = "st${lower(replace(var.project_name, "-", ""))}${random_string.suffix.result}"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  min_tls_version = "TLS1_2"
  public_network_access_enabled = false
  allow_nested_items_to_be_public = false
  tags = { Purpose = "SecurityEvidence" }
}
