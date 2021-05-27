resource "azurerm_resource_group" "rg_uat" {
  name     = "RG-UAT-10"
  location = "southeastasia"     #Change the location to chinaeast2
  
  tags     = {
    environment = "dev"  #Update the tag
    costcenter  = "it"
  }
}

module "vnet_uat" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.rg_uat.name
  address_spaces      = ["10.10.64.0/20"]
  subnet_prefixes     = ["10.10.64.0/24", "10.10.65.0/24"]
  subnet_names        = ["SNT-UAT-DMZ-64", "SNT-UAT-internal-65"]

  tags = {
    ENV = "Prod"
    #costcenter  = "it"
  }
  