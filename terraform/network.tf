resource "azurerm_virtual_network" "main" {
  name = "${var.project_name}-VNET"
  address_space = ["10.50.0.0/16"]
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}
resource "azurerm_subnet" "endpoint" {
  name = "EndpointSubnet"
  resource_group_name = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = ["10.50.1.0/24"]
}
resource "azurerm_network_security_group" "endpoint" {
  name = "${var.project_name}-Endpoint-NSG"
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  security_rule {
    name = "AllowRDPFromAdminIP-ReplaceBeforeUse"
    priority = 100
    direction = "Inbound"
    access = "Deny"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "3389"
    source_address_prefix = "Internet"
    destination_address_prefix = "*"
  }
}
