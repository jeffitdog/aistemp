module "vnet_uat" {
  source              = "./module/terraform-azurerm-network"
  resource_group_name = azurerm_resource_group.rg_uat.name
  address_spaces      = [var.vnet_space]
  subnet_prefixes     = [var.subnet_space[0], var.subnet_space[1]]
  subnet_names        = [var.subnet_name[0], var.subnet_name[1]]
  vnet_name           = var.vnet_name
  tags = {
    env = "uat"
    #costcenter  = "it"
  }
}
  
  