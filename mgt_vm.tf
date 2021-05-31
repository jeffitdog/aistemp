resource "azurerm_resource_group" "rg_mgt" {
  name     = var.mgt_rg_name
  location = "southeastasia"     #Change the location to chinaeast2
  
  tags     = {
    environment = "dev"  #Update the tag
  }
}
#Restore back later

module "mgt_admin" {
  source = "./module/terraform-azurerm-compute"
  #source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.rg_mgt.name
  #vm_os_simple        = "UbuntuServer" 
  public_ip_dns       = ["publicdns","publicdns2"] // change to a unique name per datacenter region
  vnet_subnet_id  = module.vnet_mgt.vnet_subnets[1]
  #remote_port     = "22"
 #ssh_key         = "./id_rsa.pub"
 #vm_hostname = ["VM-W-Management-Admin-File-10","VM-W-Management-Admin-AD01-45","VM-W-Management-Admin-AD02-46", "VM-W-Management-Admin-AD03-47"]
  vm_hostname = ["VMWMgtAdmFile","VMWMgtAdmAD01"]
  #vm_hostname = "my-vm"
  nb_instances    = 2
  nb_public_ip    = 0
  vm_os_offer     = "WindowsServer"
  vm_os_publisher = "MicrosoftWindowsServer"
  vm_os_sku       = "2019-Datacenter"
  vm_os_version   = "latest"
  vm_size         = ["Standard_F4s_v2","Standard_F4s_v2","Standard_F2s_v2","Standard_F2s_v2"]
  storage_account_type    = "Standard_LRS"
  private_ip_address      = ["10.10.49.10","10.10.49.45","10.10.49.46","10.10.49.47"]
  #source_address_prefixes   = ["13.67.111.51"]


  depends_on = [azurerm_resource_group.rg_mgt]
}

