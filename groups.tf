# terraform {
#  backend "azurerm" {
#     resource_group_name   = "learn"
#     storage_account_name  = "learn_storage"
#     container_name        = "learn_container"
#     key                   = "network.tfstate"
# }
# }

# Ctrl+K+C  - to comment out
# Ctrl+K+U - to uncomment

# #Create a RG
# resource "azurerm_resource_group" "rg-ft-learn" {
#   location = "ukwest"
#   name     = "learn"

# }
