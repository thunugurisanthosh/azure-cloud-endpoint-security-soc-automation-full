resource "azurerm_public_ip" "endpoint" {
  name = "pip-${var.project_name}-endpoint"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method = "Static"
  sku = "Standard"
}
resource "azurerm_network_interface" "endpoint" {
  name = "nic-${var.project_name}-endpoint"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  ip_configuration {
    name = "primary"
    subnet_id = azurerm_subnet.endpoint.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.endpoint.id
  }
}
resource "azurerm_network_interface_security_group_association" "endpoint" {
  network_interface_id = azurerm_network_interface.endpoint.id
  network_security_group_id = azurerm_network_security_group.endpoint.id
}
resource "azurerm_windows_virtual_machine" "endpoint" {
  name = "WIN11-SOC-01"
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location
  size = var.vm_size
  admin_username = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = [azurerm_network_interface.endpoint.id]
  provision_vm_agent = true
  secure_boot_enabled = true
  vtpm_enabled = true
  os_disk { caching = "ReadWrite" storage_account_type = "Premium_LRS" }
  source_image_reference { publisher = "MicrosoftWindowsDesktop" offer = "windows-11" sku = "win11-24h2-pro" version = "latest" }
  identity { type = "SystemAssigned" }
}
