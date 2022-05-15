#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

# Ctrl+K+C  - to comment out
# Ctrl+K+U - to uncomment

#Create a RG
resource "azurerm_resource_group" "rg-ft-learn" {
  location = "ukwest"
  name     = "learn"

}

#Create a VNET
resource "azurerm_virtual_network" "learn-vnet" {
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.rg-ft-learn.location}"
  name                = "${azurerm_resource_group.rg-ft-learn.name}-vnet"
  resource_group_name = "${azurerm_resource_group.rg-ft-learn.name}"
  
}

#Create a NSG
resource "azurerm_network_security_group" "learn-nsg" {
  location            = "${azurerm_resource_group.rg-ft-learn.location}"
    name                = "${azurerm_resource_group.rg-ft-learn.name}-nsg"
  resource_group_name = "${azurerm_resource_group.rg-ft-learn.name}"  
}