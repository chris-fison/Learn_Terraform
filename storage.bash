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

#!/bin/bash
RESOURCE_GROUP_NAME=learn
STORAGE_ACCOUNT_NAME=learnstorage
CONTAINER_NAME=learncontainer
# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location ukwest
# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"