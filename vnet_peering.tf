resource "azurerm_virtual_network_peering" "uat_transit" {
  name                      = "UAT-To-Transit"
  resource_group_name       = azurerm_resource_group.rg_uat.name
  virtual_network_name      = module.vnet_uat.vnet_name
  remote_virtual_network_id = module.vnet_transit.vnet_id
}

resource "azurerm_virtual_network_peering" "transit_uat" {
  name                      = "Transit-To-UAT"
  resource_group_name       = azurerm_resource_group.rg_uat.name
  virtual_network_name      = module.vnet_transit.vnet_name
  remote_virtual_network_id = module.vnet_uat.vnet_id
}
