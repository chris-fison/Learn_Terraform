#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

# Ctrl+K+C  - to comment out
# Ctrl+K+U - to uncomment

#Create a RG
resource "azurerm_resource_group" "rg-ft-learn" {
  location = "ukwest"
  name     = "learn"

}
