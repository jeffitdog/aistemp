output "applied_dns_servers" {
  description = "If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set."
  value       = azurerm_network_interface.this.applied_dns_servers
}

output "id" {
  description = "Network Interface ID"
  value       = azurerm_network_interface.this.id
}

output "internal_domain_name_suffix" {
  description = "Even if internal_dns_name_label is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of internal_domain_name_suffix."
  value       = azurerm_network_interface.this.internal_domain_name_suffix
}

output "mac_address" {
  description = "MAC Address of Network Interface"
  value       = azurerm_network_interface.this.mac_address
}

output "ip_configuration_name" {
  value       = azurerm_network_interface.this.ip_configuration[*].name
  description = "The name of the IP configuration for connection to LB."
}

output "ip_configuration" {
  value       = azurerm_network_interface.this.ip_configuration[*]
  description = "The IP configruation associated with the Network Interface."
}

output "name" {
  description = "Network Interface name"
  value       = azurerm_network_interface.this.name
}

output "private_ip_address" {
  description = "The first private IP address of the network interface."
  value       = azurerm_network_interface.this.private_ip_address
}

output "private_ip_addresses" {
  description = "The private IP addresses of the network interface."
  value       = azurerm_network_interface.this.private_ip_addresses
}

output "virtual_machine_id" {
  description = "The ID of the Virtual Machine which this Network Interface is connected to."
  value       = azurerm_network_interface.this.virtual_machine_id
}
