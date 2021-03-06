# Purpose  
This module manages Azure Network Interface.

# How to use this module  
Include the module in your .tf files as shown below:
```
module "network_interface" {
  source = "git::https://username@dev.azure.com/asiandevbank/terraform-modules/_git/terraform-azure-network-interface"

  numberedresource              = var.numberedresource
  app                           = var.app
  component                     = var.component
  env                           = var.env
  private_ip_address_allocation = var.private_ip_address_allocation
  region                        = var.region
  resource_group_name           = var.resource_group_name
  virtual_network_subnet_id     = var.virtual_network_subnet_id

  tags = var.tags
}
```

## Notes  
Terraform Documentation can be found here: [azurerm\_network\_interface](https://www.terraform.io/docs/providers/azurerm/r/network_interface.html)

Docs generated by `terraform-docs markdown . > README.md`, [terraform-docs](https://github.com/terraform-docs/terraform-docs)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app | App strings affixed to named resources. | `string` | n/a | yes |
| component | Component strings affixed to named resources. | `string` | `""` | no |
| env | The environment for this resource | `string` | n/a | yes |
| numberedresource | The number of the resource. | `string` | `1` | no |
| private\_ip\_address | The private IP of the virtual machine if allocation is static | `string` | `""` | no |
| private\_ip\_address\_allocation | The private IP address allocation of the virtual machine (Static/Dynamic) | `string` | n/a | yes |
| public\_ip\_address\_id | The public IP id to assign to the virtual machine | `string` | `""` | no |
| region | The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created. | `string` | n/a | yes |
| resource\_group\_name | The name of the resource group in which to create the subnet. Changing this forces a new resource to be created. | `string` | n/a | yes |
| tags | The tags to apply to all resources. | `map` | `{}` | no |
| this\_depends\_on | Placeholder variable for dependcy checks. | `any` | `null` | no |
| virtual\_network\_subnet\_id | The id of the subnet. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Network Interface ID |
| ip\_configuration | The IP configruation associated with the Network Interface. |
| ip\_configuration\_name | The name of the IP configuration for connection to LB. |
| mac\_address | MAC Address of Network Interface |

