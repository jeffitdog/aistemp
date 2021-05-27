resource "azurerm_resource_group" "rg_uat" {
  name     = "RG-UAT-10"
  location = "southeastasia"     #Change the location to chinaeast2
  
  tags     = {
    environment = "dev"  #Update the tag
    costcenter  = "it"
  }
}