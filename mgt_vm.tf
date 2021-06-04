resource "azurerm_resource_group" "rg_mgt" {
  name     = var.mgt_rg_name      #所屬資源組
  location = var.region            #所屬地區                
  
  tags     = {
    environment = "dev"  #Update the tag
  }
}
#Restore back later
/*
module "mgt_admin" {
  source = "./module/terraform-azurerm-compute"
  #source              = "Azure/compute/azurerm"
  resource_group_name = azurerm_resource_group.rg_mgt.name                               #VM所屬資源組
  public_ip_dns       = ["publicdns","publicdns2"]                                       #DNS名字
  vnet_subnet_id  = module.vnet_mgt.vnet_subnets[1]                                      #VM所屬Subnet
  #remote_port     = "22"
 #ssh_key         = "./id_rsa.pub"
  vm_hostname = ["W-M-Ad-File-10","W-M-Ad-AD01-45","W-M-Ad-AD02-46", "W-M-Ad-AD03-47"]     #vm名字
  #vm_hostname = ["VMWMgtAdmFile","VMWMgtAdmAD01"]  
  #vm_hostname = "my-vm"
  nb_instances    = 1                                                                       #vm數量
  nb_public_ip    = 0                                                                       #所需public ip數量
  vm_os_offer     = "WindowsServer"                                                         #VM的OS Offer
  vm_os_publisher = "MicrosoftWindowsServer"                                                #OS publisher名字
  vm_os_sku       = "2019-Datacenter"                                                       #OS版本
  vm_os_version   = "latest"                                                                #OS型號
  vm_size         = ["Standard_F4s_v2","Standard_F4s_v2","Standard_F2s_v2","Standard_F2s_v2"]  #Change the first F4s to F8s            #OS SIZE
  storage_account_type    = "Standard_LRS"                                                  #可供選擇的有Standard_LRS, Standard_ZRS, Standard_GRS, Standard_RAGRS, Premium_LRS
  private_ip_address      = ["10.10.49.10","10.10.49.45","10.10.49.46","10.10.49.47"]       #VM的IP地址
  


  depends_on = [azurerm_resource_group.rg_mgt]
}

*/