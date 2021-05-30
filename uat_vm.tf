resource "azurerm_resource_group" "rg_uat" {
  name     = var.rg_name
  location = "southeastasia"     #Change the location to chinaeast2
  
  tags     = {
    environment = "dev"  #Update the tag
  }
}

#Restore back later
/*
module "centos_f4_v2_internal" {
  source = "./module/terraform-azurerm-compute"
  #source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.rg_uat.name
  #vm_os_simple        = "UbuntuServer" 
  public_ip_dns       = ["publicdns","publicdns2"] // change to a unique name per datacenter region
  vnet_subnet_id  = module.vnet_uat.vnet_subnets[1]
  #remote_port     = "22"
 #ssh_key         = "./id_rsa.pub"
 #vm_hostname = ["VM-C-UAT-internal-NMFS.AP01-11","VM-C-UAT-internal-NMFS.AP02-101","VM-C-UAT-internal-NMFS.AP04-104", "VM-C-UAT-internal-MobileAMF-22"]
  vm_hostname = ["VM-C-UAT-internal-NMFS.AP01-11","VM-C-UAT-internal-NMFS.AP02-101"]
  #vm_hostname = "my-vm"
  nb_instances    = 2
  nb_public_ip    = 0
  vm_os_offer     = "CentOS"
  vm_os_publisher = "OpenLogic"
  vm_os_sku       = "7_9"
  vm_os_version   = "latest"
  vm_size         = ["Standard_F4s_v2","Standard_F2s_v2"]
  storage_account_type    = "Standard_LRS"
  private_ip_address      = ["10.10.65.11","10.10.65.101","10.10.65.104","10.10.65.111"]
  #source_address_prefixes   = ["13.67.111.51"]


  depends_on = [azurerm_resource_group.rg_uat]
}

*/