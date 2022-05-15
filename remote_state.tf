terraform {
 backend "azurerm" {
    resource_group_name   = "learn"
    storage_account_name  = "ftlearnstorage"
    container_name        = "ftlearncontainer"
    key                   = "learn.tfstate"
}
}


# Ctrl+K+C  - to comment out
# Ctrl+K+U - to uncomment
