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

module "vnet_transit" {
  source              = "./module/terraform-azurerm-network"
  resource_group_name = azurerm_resource_group.rg_uat.name
  address_spaces      = var.transit_vnet_space
  subnet_prefixes     = [var.transit_subnet_space[0], var.transit_subnet_space[1]]
  subnet_names        = [var.transit_subnet_name[0], var.transit_subnet_name[1]]
  vnet_name           = var.transit_vnet_name
  tags = {
    env = "uat"
    #costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg_uat]
}

module "vnet_mgt" {
  source              = "./module/terraform-azurerm-network"
  resource_group_name = azurerm_resource_group.rg_uat.name
  address_spaces      = var.mgt_vnet_space
  subnet_prefixes     = [var.mgt_subnet_space[0], var.mgt_subnet_space[1], var.mgt_subnet_space[2]]
  subnet_names        = [var.mgt_subnet_name[0], var.mgt_subnet_name[1], var.mgt_subnet_name[2]]
  vnet_name           = var.mgt_vnet_name
  tags = {
    env = "uat"
    #costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg_uat]
}




/*  
resource "azurerm_network_interface" "vm" {
  #count                         = var.nb_instances
  count                         = 1
  #name                          = "${var.vm_hostname[count.index]}-nic"
  name                          = "test-nic"
  resource_group_name           = var.rg_name
  location                      = southeastasia     #change to chinaeast2
  enable_accelerated_networking = var.enable_accelerated_networking

  ip_configuration {
    #name                          = "${var.vm_hostname}-ip-${count.index}"
    name                          = "testprivate-ip"  
    subnet_id                     = var.vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = length(azurerm_public_ip.vm.*.id) > 0 ? element(concat(azurerm_public_ip.vm.*.id, list("")), count.index) : ""
  }

  tags = var.tags
}



*/