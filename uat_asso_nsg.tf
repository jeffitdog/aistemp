module "NSG_UAT_internal" {
  source                        = "./module/terraform-azure-nsg-association"
  network_security_group_name   = var.nsg_name[1]
  subnet_name                   = var.subnet_name[1]
  virtual_network_name          = var.vnet_name
  resource_group_name           = var.rg_name
}
