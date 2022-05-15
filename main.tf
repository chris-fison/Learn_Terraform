#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

# Ctrl+K+C  - to comment out
# Ctrl+K+U - to uncomment

#Create a RG
resource "azurerm_resource_group" "fisontech" {
  location = "ukwest"
  name     = "fison"

}

#Create a VNET
resource "azurerm_virtual_network" "fisontech" {
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.fisontech.location}"
  name                = "${azurerm_resource_group.fisontech.name}-vnet"
  resource_group_name = "${azurerm_resource_group.fisontech.name}"
  
}

# #Create a VM
# resource "azurerm_virtual_machine" "fisontech" {
#     location = "value"
#     name = "value"
#     network_interface_ids = [ "value" ]
#     resource_group_name = "value"
#     vm_size = "value"
#     storage_os_disk {
#         create_option = "value"
#         name = "value"
#     }
# }






# #Create a Subnet
# resource "azurerm_subnet" "name" {
#     address_prefixes = [ "value" ]
#     name = "value"
#     resource_group_name = "value"
#     virtual_network_name = "value"

# }