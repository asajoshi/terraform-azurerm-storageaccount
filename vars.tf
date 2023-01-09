variable "AZURE_SUBSCRIPTION_ID" {
  type = string
}

variable "VNET_RG" {
  type = string
}

variable "VNET_NAME" {
  type = string
}

variable "CLUSTER_NAME" {
  type = string
}


locals {
  subnet_id = "/subscriptions/${AZURE_SUBSCRIPTION_ID}/resourceGroups/${VNET_RG}/providers/Microsoft.Network/virtualNetworks/${VNET_NAME}/subnets/${CLUSTER_NAME}-private-endpoints"
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


