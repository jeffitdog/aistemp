module "linuxservers" {
  source = "./module/terraform-azurerm-compute"
  #source              = "Azure/compute/azurerm"
  resource_group_name = var.rg_name
  #vm_os_simple        = "UbuntuServer" 
  public_ip_dns       = ["publicdns","publicdns2"] // change to a unique name per datacenter region
  vnet_subnet_id  = module.vnet_uat.vnet_subnets[0]
  #remote_port     = "22"
 #ssh_key         = "./id_rsa.pub"
 vm_hostname = ["public-vm-1","public-vm-2","private-vm-1"]
  #vm_hostname = "my-vm"
  nb_instances    = 1
  nb_public_ip    = 0
  vm_os_offer     = "CentOS"
  vm_os_publisher = "OpenLogic"
  vm_os_sku       = "7_9"
  vm_os_version   = "latest"
  vm_size         = "Standard_F4s_v2"
  data_sa_type    = "Standard_LRS"
  #source_address_prefixes   = ["13.67.111.51"]
}