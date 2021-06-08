#關於VM參數的解釋，請參閱mgt_vm.tf
resource "azurerm_resource_group" "rg_transit" {
  name     = var.transit_rg_name
  location = var.region  
  
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
  vnet_subnet_id  = module.vnet_transit.vnet_subnets[1]
  #remote_port     = "22"
 #ssh_key         = "./id_rsa.pub"
 #vm_hostname = ["VM-C-UAT-internal-NMFS.AP01-11","VM-C-UAT-internal-NMFS.AP02-101","VM-C-UAT-internal-NMFS.AP04-104", "VM-C-UAT-internal-MobileAMF-22"]
  vm_hostname = ["C-T-Basn-SV-201"]
  #vm_hostname = "my-vm"
  nb_instances    = 1
  nb_public_ip    = 0
  vm_os_offer     = "CentOS"
  vm_os_publisher = "OpenLogic"
  vm_os_sku       = "7_9"
  vm_os_version   = "latest"
  vm_size         = ["Standard_F2s_v2"]
  storage_account_type    = "Standard_LRS"
  private_ip_address      = ["10.10.17.201"]
  admin_password = var.admin_password
  admin_username = var.admin_username
  #source_address_prefixes   = ["13.67.111.51"]
  tags                  ={
    Env = "Prod"
    Function = "Security"
    Cost = "_$AIS_$MSZ_$MTJ"
  }

}

module "transit_proddb" {
  source = "./module/terraform-azurerm-compute"
  #source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.rg_transit.name
  #vm_os_simple        = "UbuntuServer" 
  public_ip_dns       = ["publicdns","publicdns2"] // change to a unique name per datacenter region
  vnet_subnet_id  = module.vnet_transit.vnet_subnets[3]
  #remote_port     = "22"
 #ssh_key         = "./id_rsa.pub"
  vm_hostname = ["W-T-PDB2U-SV-1"]
  #vm_hostname = "my-vm"
  nb_instances    = 1
  nb_public_ip    = 0
  vm_os_offer     = "WindowsServer"
  vm_os_publisher = "MicrosoftWindowsServer"
  vm_os_sku       = "2019-Datacenter"
  vm_os_version   = "latest"
  vm_size         = ["Standard_Ds2_v2"]
  storage_account_type    = "Standard_LRS"
  admin_password = var.admin_password
  admin_username = var.admin_username
  private_ip_address      = ["10.10.20.4"]
  #source_address_prefixes   = ["13.67.111.51"]
  tags                  ={
    Env = "Prod"
    Function = "Operation"
    Cost = "_$MSZ_$MTJ"
  }


  depends_on = [azurerm_resource_group.rg_transit]
}


