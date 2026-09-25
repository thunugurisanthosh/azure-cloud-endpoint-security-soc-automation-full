resource "azurerm_user_assigned_identity" "automation" {
  name = "id-${var.project_name}-automation"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
