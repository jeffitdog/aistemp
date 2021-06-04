#關於VM參數的解釋，請參閱mgt_vm.tf
resource "azurerm_resource_group" "rg_uat" {
  name     = var.rg_name
  location = var.region  
  
  tags     = {
    environment = "uat"  #Update the tag
  }
}

#Restore back later
/*
module "UAT_internal" {
  source = "./module/terraform-azurerm-compute"
  #source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.rg_uat.name
  #vm_os_simple        = "UbuntuServer" 
  public_ip_dns       = ["publicdns","publicdns2"] // change to a unique name per datacenter region
  vnet_subnet_id  = module.vnet_uat.vnet_subnets[1]
  #remote_port     = "22"
 #ssh_key         = "./id_rsa.pub"
  vm_hostname = ["C-U-in-NMAP1-11","C-U-in-NMAP2-01","C-U-in-NMBA1-03", "C-U-in-NMAP4-04","C-U-in-NMBAT02","C-U-in-Mo-22","C-U-in-Mo-Tk-23"]
 #vm_hostname = ["VM-C-UAT-internal-NMFS.AP01-11","VM-C-UAT-internal-NMFS.AP02-101"]
  #vm_hostname = "my-vm"
  nb_instances    = 2
  nb_public_ip    = 0
  vm_os_offer     = "CentOS"
  vm_os_publisher = "OpenLogic"
  vm_os_sku       = "7_9"
  vm_os_version   = "latest"
  vm_size         = ["Standard_F4s_v2","Standard_F4s_v2","Standard_D3_v2","Standard_F4s_v2","Standard_F4s_v2","Standard_F4s_v2","Standard_F2s_v2"]
  storage_account_type    = "Standard_LRS"
  private_ip_address      = ["10.10.65.11","10.10.65.101","10.10.65.103","10.10.65.104","10.10.65.111","10.10.65.22","10.10.65.23"]
  #source_address_prefixes   = ["13.67.111.51"]


  depends_on = [azurerm_resource_group.rg_uat]
}

module "UAT_DMZ" {
  source = "./module/terraform-azurerm-compute"
  #source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.rg_uat.name
  #vm_os_simple        = "UbuntuServer" 
  public_ip_dns       = ["publicdns","publicdns2"] // change to a unique name per datacenter region
  vnet_subnet_id  = module.vnet_uat.vnet_subnets[0]
  #remote_port     = "22"
 #ssh_key         = "./id_rsa.pub"
  vm_hostname = ["C-U-DM-NM-122","C-U-DM-Mo-22"]
 #vm_hostname = "my-vm"
  nb_instances    = 2
  nb_public_ip    = 0
  vm_os_offer     = "CentOS"
  vm_os_publisher = "OpenLogic"
  vm_os_sku       = "7_9"
  vm_os_version   = "latest"
  vm_size         = ["Standard_F8s_v2","Standard_F2s_v2"]
  storage_account_type    = "Standard_LRS"
  private_ip_address      = ["10.10.64.122","10.10.64.22"]
  #source_address_prefixes   = ["13.67.111.51"]


  depends_on = [azurerm_resource_group.rg_uat]
}
*/