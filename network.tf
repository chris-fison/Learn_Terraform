#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

# Ctrl+K+C  - to comment out
# Ctrl+K+U - to uncomment
# Ctrl_space - show related items

terraform {
 backend "azurerm" {
    resource_group_name   = "learn"
    storage_account_name  = "learn_state"
    container_name        = "learn_container"
    key                   = "network.tfstate"
}
}

#Create a VNET
resource "azurerm_virtual_network" "learn-vnet" {
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-ft-learn.location
  name                = "${azurerm_resource_group.rg-ft-learn.name}-vnet"
  resource_group_name = azurerm_resource_group.rg-ft-learn.name

}

#Create a NSG
resource "azurerm_network_security_group" "learn-nsg" {
  location            = azurerm_resource_group.rg-ft-learn.location
  name                = "${azurerm_resource_group.rg-ft-learn.name}-nsg"
  resource_group_name = azurerm_resource_group.rg-ft-learn.name

  security_rule {
    access                     = "Allow"
    description                = "Allow SFTP"
    destination_address_prefix = "*"
    # destination_address_prefixes = [ "value" ]
    # destination_application_security_group_ids = [ "value" ]
    destination_port_range = "22"
    # destination_port_ranges = [ "value" ]
    direction             = "Inbound"
    name                  = "Allow-Inbound-SFTP"
    priority              = 100
    protocol              = "Tcp"
    source_address_prefix = "Internet"
    # source_address_prefixes = [ "value" ]
    # source_application_security_group_ids = [ "value" ]
    source_port_range = "*"
    # source_port_ranges = [ "value" ]
  }

}