module "NSG_UAT_internal" {
  source                        = "./module/terraform-azure-nsg-association"
  network_security_group_name   = module.NSG_UAT_internal.NSG-UAT-internal
  subnet_name                   = module.vnet_uat.subnet_names[1]
  virtual_network_name          = module.vnet_uat.vnet_name
  resource_group_name           = azurerm_resource_group.rg_uat.name
}