resource "azurerm_resource_group" "rg_transit" {
  name     = var.transit_rg_name
  location = "southeastasia"     #Change the location to chinaeast2
  
  tags     = {
    environment = "dev"  #Update the tag
  }
}

#Restore back later

module "transit_bastion" {
  source = "./module/terraform-azurerm-compute"
  #source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.rg_transit.name
  #vm_os_simple        = "UbuntuServer" 
  public_ip_dns       = ["publicdns","publicdns2"] // change to a unique name per datacenter region
  vnet_subnet_id  = module.vnet_transit.vnet_subnets[2]
  #remote_port     = "22"
 #ssh_key         = "./id_rsa.pub"
 #vm_hostname = ["VM-C-UAT-internal-NMFS.AP01-11","VM-C-UAT-internal-NMFS.AP02-101","VM-C-UAT-internal-NMFS.AP04-104", "VM-C-UAT-internal-MobileAMF-22"]
  vm_hostname = ["VM-C-Transit-Bastion","VM-C-UAT-internal-NMFS.AP02-101"]
  #vm_hostname = "my-vm"
  nb_instances    = 1
  nb_public_ip    = 0
  vm_os_offer     = "CentOS"
  vm_os_publisher = "OpenLogic"
  vm_os_sku       = "7_9"
  vm_os_version   = "latest"
  vm_size         = ["Standard_F2s_v2"]
  storage_account_type    = "Standard_LRS"
  private_ip_address      = ["10.10.17.201","10.10.65.101","10.10.65.104","10.10.65.111"]
  #source_address_prefixes   = ["13.67.111.51"]


  depends_on = [azurerm_resource_group.rg_uat]
}

