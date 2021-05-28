data "azurerm_resource_group" "this" {
  name = var.resource_group_name
  depends_on = [azurerm_resource_group.rg_uat]
}

data "azurerm_network_security_group" "this" {
  name                = var.network_security_group_name
  resource_group_name = data.azurerm_resource_group.this.name
  depends_on = [azurerm_resource_group.rg_uat]
}

data "azurerm_virtual_network" "this" {
    name = var.virtual_network_name
    resource_group_name = data.azurerm_resource_group.this.name
    depends_on = [azurerm_resource_group.rg_uat]
}

data "azurerm_subnet" "this" {
    name = var.subnet_name
    virtual_network_name = data.azurerm_virtual_network.this.name
    resource_group_name = data.azurerm_resource_group.this.name
    depends_on = [azurerm_resource_group.rg_uat]
}