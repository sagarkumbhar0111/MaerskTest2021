variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "rg-macrolife-prod-001"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "westeurope"
}

variable "vnetwork_name" {
  description = "Name of your Azure Virtual Network"
  default     = "vnet-azure-westeurope-001"
}

variable "vnet_address_space" {
  description = "The address space to be used for the Azure virtual network."
  default     = ["10.0.0.0/16"]
}

variable "keyvault_name" {
  description = "Key vault name"
  default     = "kv-macrolife-prod-001"
}
