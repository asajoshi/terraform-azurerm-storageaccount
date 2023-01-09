variable "subnet_id" {
  default = "/subscriptions/${AZURE_SUBSCRIPTION_ID}/resourceGroups/${VNET_RG}/providers/Microsoft.Network/virtualNetworks/${VNET_NAME}/subnets/${CLUSTER_NAME}-private-endpoints"
  type = string
}

variable "storageaccount_name" {
  type = string
  default = "storageaccountpulsars"
}

variable "account_kind" {
  type = string
  default = "StorageV2"
}

variable "account_tier" {
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  type = string
  default = "GRS"
}

variable "resource_group_name" {
  type = string
  default = "pulsars-resources"
}

variable "location" {
  type = string
  default = "West Europe"
}

variable "config_path" {
  type = string
  default = "/Users/AJOSHI7/.kube/config"
}


