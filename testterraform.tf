resource "azurerm_resource_group" "testterraform" {
  name     = "terraformtest"
  #name     = "ValidName"
  location = "West Europe"
  
  tags     = {
    environment = "dev"
    costcenter  = "it"
  }
}
