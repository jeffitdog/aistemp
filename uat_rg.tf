resource "azurerm_resource_group" "rg_uat" {
  name     = var.rg_name
  location = "southeastasia"     #Change the location to chinaeast2
  
  tags     = {
    environment = "dev"  #Update the tag
  }
}