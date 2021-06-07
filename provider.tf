provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    version = "~>2.0"
    environment ="china"
    features {}

}

terraform {
  backend "azurerm" {
    resource_group_name  = "RSG-Management-10"
    storage_account_name = "saterraform"
    container_name       = "tfstate"
    key                  = "tfstate"
    use_azuread_auth     = true
    subscription_id      = "0b55fe56-6a59-418a-b309-873b61cd8b0b"
    tenant_id            = "293ec2c6-12b1-46e7-b244-32c4e87697cb"
    environment          = "china"
  }
}

