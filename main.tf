#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

# Ctrl+K+C  - to comment out
# Ctrl+K+U - to uncomment

#Create a RG
resource "azurerm_resource_group" "rg-ft-learn" {
  location = "ukwest"
  name     = "learn"

}

#Create a VNET
resource "azurerm_virtual_network" "fisontech" {
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-ft-learn.location
  name                = "${azurerm_resource_group.rg-ft-learn.name}-vnet"
  resource_group_name = azurerm_resource_group.rg-ft-learn.name

}