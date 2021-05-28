esource "azurerm_storage_account" "macrolife" {
  name                     = "stamacrolifeprod001"
  location                 = locals.location
  resource_group_name      = var.resource_group_name
  account_tier             = "standard"
  account_replication_type = "lrs"
}

resource "azurerm_storage_container" "macrolife" {
  name                  = "cntstamacrolifeprod001"
  storage_account_name  = azurerm_storage_account.macrolife.name
  container_access_type = "private"
}
