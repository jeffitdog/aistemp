module "NSG-UAT-DMZ" {
  source                = "./module/terraform-azurerm-network-security-group"
  resource_group_name   = azurerm_resource_group.rg_uat.name
  location              = "southeastasia" #  change to chinaeast2
  security_group_name   = "NSG-UAT-DMZ"
  source_address_prefix = ["10.0.3.0/24"]
  custom_rules = [
    {
      name                   = "3-1-1"
      priority               = 110
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "22"
      source_address_prefix  = "10.10.17.200/29"
      destination_address_prefix = "10.10.64.0/24"
      description            = "堡垒机"
    },
    {
      name                    = "3-2-1"
      priority                = 120
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      #destination_port_range  = ["22,25,199,8080,8443"]
      destination_port_range  = "22,25,199,8080,8443"
      source_address_prefixes = ["10.10.19.0/24"]
      destination_address_prefix = "10.10.64.122"
      description             = "来自AG的MFS应用服务测试"
    },
  ]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.rg_uat]
}