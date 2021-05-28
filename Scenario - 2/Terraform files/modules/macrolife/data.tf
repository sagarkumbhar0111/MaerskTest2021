data "azurerm_key_vault" "keyvault" {
  name                = "${var.keyvault_name}"
  resource_group_name = "${var.resourcegroup_name}"
}

data "azurerm_key_vault_secret" "win_admin_userid" {
  name         = "adminusername"
  key_vault_id = "${data.azurerm_key_vault.keyvault.id}"
}

data "azurerm_key_vault_secret" "win_admin_pass" {
  name         = "adminuserpass"
  key_vault_id = "${data.azurerm_key_vault.keyvault.id}"
}