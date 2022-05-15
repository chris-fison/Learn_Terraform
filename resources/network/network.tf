# Ctrl+K+C  - to comment out
# Ctrl+K+U - to uncomment
# Ctrl_space - show related items



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
    destination_port_range = "22"
    direction             = "Inbound"
    name                  = "Allow-Inbound-SFTP"
    priority              = 100
    protocol              = "Tcp"
    source_address_prefix = "Internet"
    source_port_range = "*"
  }

   security_rule {
    access                     = "Allow"
    description                = "Allow FTP"
    destination_address_prefix = "*"
    destination_port_range = "20-21"
    direction             = "Inbound"
    name                  = "Allow-Inbound-FTP"
    priority              = 101
    protocol              = "Tcp"
    source_address_prefix = "Internet"
    source_port_range = "*"
  }

}