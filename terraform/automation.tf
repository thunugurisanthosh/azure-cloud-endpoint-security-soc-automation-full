resource "azurerm_logic_app_workflow" "incident_response" {
  name = "logic-${var.project_name}-incident-response"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  identity { type = "SystemAssigned" }
  tags = { Purpose = "SOC-Automation" }
}
resource "azurerm_role_assignment" "logic_rg_reader" {
  scope = azurerm_resource_group.main.id
  role_definition_name = "Reader"
  principal_id = azurerm_logic_app_workflow.incident_response.identity[0].principal_id
}
