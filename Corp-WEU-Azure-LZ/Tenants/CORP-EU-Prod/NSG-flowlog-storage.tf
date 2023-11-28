resource "azurerm_storage_account" "corpstorweupsecflowlog" {
  provider                 = azurerm.weu-security-sub
  name                     = "corpstorweupsecflowlog"
  resource_group_name      = local.security-subscription-rg[1]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = []
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.security_subscription_tags[local.security-subscription-rg[1]]
  allow_nested_items_to_be_public = false
}


resource "azurerm_storage_account" "corpstorweudsecflowlog" {
  provider                 = azurerm.weu-security-sub
  name                     = "corpstorweudsecflowlog"
  resource_group_name      = local.security-subscription-rg[2]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = []
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.security_subscription_tags[local.security-subscription-rg[2]]
  allow_nested_items_to_be_public = false
}
