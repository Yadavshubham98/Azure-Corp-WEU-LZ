// WEU Boot Diagnostics Storage Accounts

resource "azurerm_storage_account" "corpstorweuutisdiag10" {
  provider                 = azurerm.weu-uat-tis-sub
  name                     = "corpstorweuutisdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[0]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-uat-tis-subnet[0].id]
    ip_rules                   = []
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[0]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "corpstorweuutasdiag10" {
  provider                 = azurerm.weu-uat-tas-sub
  name                     = "corpstorweuutasdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[1]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-uat-tas-subnet[0].id]
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[1]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "corpstorweuptisdiag10" {
  provider                 = azurerm.weu-prod-tis-sub
  name                     = "corpstorweuptisdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[2]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-prod-tis-subnet[0].id]
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[2]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "corpstorweuptasdiag10" {
  provider            = azurerm.weu-prod-tas-sub
  name                = "corpstorweuptasdiag10"
  resource_group_name = local.weu-bootdiag-rgs[3]
  location            = var.location-weu
  account_tier        = "Standard"
  min_tls_version     = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-prod-tas-subnet[0].id]
  }
  blob_properties {
    versioning_enabled = true
  }
  account_replication_type        = "LRS"
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[3]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "corpstorweupsecdiag10" {
  provider                 = azurerm.weu-security-sub
  name                     = "corpstorweupsecdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[4]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = []
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[4]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "corpstorweupmgmtdiag10" {
  provider                 = azurerm.weu-management-sub
  name                     = "corpstorweupmgmtdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[5]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-prod-management-subnet[0].id]
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[5]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "corpstorweudmgmtdiag10" {
  provider                 = azurerm.weu-management-sub
  name                     = "corpstorweudmgmtdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[6]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-dev-management-subnet[0].id]
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[6]]
  allow_nested_items_to_be_public = false
}
resource "azurerm_storage_account" "corpstorweudtisdiag10" {
  provider                 = azurerm.weu-dev-tis-sub
  name                     = "corpstorweudtisdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[7]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-dev-tis-subnet[0].id]
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[7]]
  allow_nested_items_to_be_public = false
}
resource "azurerm_storage_account" "corpstorweudtasdiag10" {
  provider                 = azurerm.weu-dev-tas-sub
  name                     = "corpstorweudtasdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[8]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-dev-tas-subnet[0].id]
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[8]]
  allow_nested_items_to_be_public = false
}
resource "azurerm_storage_account" "corpstorweupiddiag10" {
  provider                 = azurerm.weu-identity-sub
  name                     = "corpstorweupiddiag10"
  resource_group_name      = local.weu-bootdiag-rgs[9]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-prod-identity-subnet[0].id]
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[9]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "corpstorweudiddiag10" {
  provider                 = azurerm.weu-identity-sub
  name                     = "corpstorweudiddiag10"
  resource_group_name      = local.weu-bootdiag-rgs[10]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["None"]
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-dev-identity-subnet[0].id]
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[10]]
  allow_nested_items_to_be_public = false
}

