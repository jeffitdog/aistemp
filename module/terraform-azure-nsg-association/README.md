# Purpose 
This module creates an Azure Network Security Group Association.

# How to use this module
Include the module in your .tf files as shown below:
```
module "nsg_association" {
  source                    = "git::https://username@dev.azure.com/asiandevbank/terraform-modules/_git/terraform-azure-nsg-association"
  network_security_group_id = var.network_security_group_id
  subnet_id                 = var.subnet_id
}
```