# Ctrl+K+C  - to comment out
# Ctrl+K+U - to uncomment
# Ctrl_space - show related items

#Create a RG
resource "azurerm_resource_group" "rg-ft-learn-compute" {
  location = "ukwest"
  name     = "learn-compute"

}
