variable "location" { type = string default = "East US 2" }
variable "project_name" { type = string default = "AZSEC-SOC" }
variable "resource_group_name" { type = string default = "rg-azsec-soc-lab" }
variable "admin_username" { type = string default = "azureadmin" }
variable "admin_password" { type = string sensitive = true }
variable "alert_email" { type = string }
variable "vm_size" { type = string default = "Standard_B2s" }
