output "resource_group_name" { value = azurerm_resource_group.main.name }
output "log_analytics_workspace_id" { value = azurerm_log_analytics_workspace.main.id }
output "sentinel_workspace_name" { value = azurerm_log_analytics_workspace.main.name }
output "endpoint_vm_name" { value = azurerm_windows_virtual_machine.endpoint.name }
output "endpoint_private_ip" { value = azurerm_network_interface.endpoint.private_ip_address }
output "endpoint_public_ip" { value = azurerm_public_ip.endpoint.ip_address }
output "logic_app_name" { value = azurerm_logic_app_workflow.incident_response.name }
