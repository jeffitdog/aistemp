module "vnet_uat" {
  source              = "./module/terraform-azurerm-network"
  resource_group_name = azurerm_resource_group.rg_uat.name
  address_spaces      = var.vnet_space
  subnet_prefixes     = [var.subnet_space[0], var.subnet_space[1]]
  subnet_names        = [var.subnet_name[0], var.subnet_name[1]]
  vnet_name           = var.vnet_name
  tags = {
    env = "uat"
    #costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg_uat]
}
/*
module "vnet_transit" {
  source              = "./module/terraform-azurerm-network"
  resource_group_name = azurerm_resource_group.rg_transit.name
  address_spaces      = var.transit_vnet_space
  subnet_prefixes     = [var.transit_subnet_space[0], var.transit_subnet_space[1]]
  subnet_names        = [var.transit_subnet_name[0], var.transit_subnet_name[1]]
  vnet_name           = var.transit_vnet_name
  tags = {
    env = "transit"
    #costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg_transit]
}
*/

module "vnet_mgt" {
  source              = "./module/terraform-azurerm-network"
  resource_group_name = azurerm_resource_group.rg_mgt.name
  address_spaces      = var.mgt_vnet_space
  subnet_prefixes     = [var.mgt_subnet_space[0], var.mgt_subnet_space[1], var.mgt_subnet_space[2]]
  subnet_names        = [var.mgt_subnet_name[0], var.mgt_subnet_name[1], var.mgt_subnet_name[2]]
  vnet_name           = var.mgt_vnet_name
  tags = {
    env = "mgt"
    #costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg_mgt]
}
