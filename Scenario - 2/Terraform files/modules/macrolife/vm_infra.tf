
resource "azurerm_resource_group" "macrolife" {
  name     = var.resource_group_name
  location = locals.location
}

resource "azurerm_network_security_group" "macrolife" {
  name                = "acceptanceTestSecurityGroup1"
  location            = locals.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_ddos_protection_plan" "macrolife" {
  name                = "ddospplan1"
   location            = locals.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "macrolife" {
  name                = "vnetmacrolife001"
  location            = locals.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.macrolife.id
    enable = true
  }

  subnet {
    name           = "subnetVnetmacrolife001_1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnetVnetmacrolife001_2"
    address_prefix = "10.0.2.0/24"
  }
}

resource "azurerm_windows_virtual_machine" "macrolife" {
  name                = "example-machine"
  resource_group_name = var.resource_group_name
  location            = locals.location
  size                = "Standard_F2"
  subnet              = "subnetVnetmacrolife001_1"
  admin_username     = data.azurerm_key_vault_secret.win_admin_userid.value
  admin_password     = data.azurerm_key_vault_secret.win_admin_pass.value
  
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  
  resource "azurerm_windows_virtual_machine" "macrolife" {
  name                = "example-machine"
  resource_group_name = var.resource_group_name
  location            = locals.location
  size                = "Standard_F2"
  subnet              = "subnetVnetmacrolife001_2"
  admin_username     = data.azurerm_key_vault_secret.win_admin_userid.value
  admin_password     = data.azurerm_key_vault_secret.win_admin_pass.value
  
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }