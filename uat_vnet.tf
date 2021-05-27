module "vnet_uat" {
  source              = "./module/terraform-azurerm-network"
  resource_group_name = azurerm_resource_group.rg_uat.name
  address_spaces      = ["10.10.64.0/20"]
  subnet_prefixes     = ["10.10.64.0/24", "10.10.65.0/24"]
  subnet_names        = ["SNT-UAT-DMZ-64", "SNT-UAT-internal-65"]
  vnet_name           = var.vnet_name
  tags = {
    ENV = "Prod"
    #costcenter  = "it"
  }
}
  
  