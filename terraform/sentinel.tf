resource "azurerm_sentinel_log_analytics_workspace_onboarding" "main" {
  workspace_id = azurerm_log_analytics_workspace.main.id
}
resource "azurerm_monitor_action_group" "security" {
  name = "ag-${var.project_name}-security"
  resource_group_name = azurerm_resource_group.main.name
  short_name = "azsec"
  email_receiver { name = "SecurityTeam" email_address = var.alert_email }
}
