resource "azurerm_resource_group" "rg_uat {
  name     = "RG-UAT-10"
  location = "West Europe"     #Change the location to chinaeast2
  
  tags     = {
    environment = "dev"  #Update the tag
    costcenter  = "it"
  }
}

module "vnet_uat" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  address_spaces      = ["10.0.0.0/16", "10.2.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }