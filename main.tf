// Modules _must_ use remote state. The provider does not persist state.
terraform {
  backend "kubernetes" {
    secret_suffix     = "providerconfig-terradefault"
    namespace         = "cluster-core"
    #in_cluster_config = true
    config_path  = var.config_path
  }
}

resource "azurerm_resource_group" "pulsars" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "pulsarsaccount" {
  name                     = var.storageaccount_name
  public_network_access_enabled = false
  account_kind = var.account_kind
  resource_group_name      = azurerm_resource_group.pulsars.name
  location                 = azurerm_resource_group.pulsars.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = {
    environment = "pulsars-test"
  }
}

resource "azurerm_private_endpoint" "storageaccount-endpoint" {
  name                = azurerm_storage_account.pulsarsaccount.name
  location            = azurerm_resource_group.pulsars.location
  resource_group_name = azurerm_resource_group.pulsars.name
  subnet_id           = local.subnet_id
  private_service_connection {
    name                           = "privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.pulsarsaccount.id
    is_manual_connection           = false
    subresource_names = ["blob"]
  }

}

