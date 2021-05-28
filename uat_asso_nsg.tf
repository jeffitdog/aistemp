/*
module "asso_dmz" {
  source                        = "./module/terraform-azure-nsg-association"
  network_security_group_name   = var.nsg_name[0]
  subnet_name                   = var.subnet_name[0]
  virtual_network_name          = var.vnet_name
  resource_group_name           = var.rg_name

  depends_on = [module.NSG_UAT_DMZ]
}

module "asso_int" {
  source                        = "./module/terraform-azure-nsg-association"
  network_security_group_name   = var.nsg_name[1]
  subnet_name                   = var.subnet_name[1]
  virtual_network_name          = var.vnet_name
  resource_group_name           = var.rg_name

  depends_on = [module.NSG_UAT_internal]
}   

*/