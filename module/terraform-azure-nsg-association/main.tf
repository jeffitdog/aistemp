resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = data.azurerm_subnet.this.id
  network_security_group_id = data.azurerm_network_security_group.this.id
}
