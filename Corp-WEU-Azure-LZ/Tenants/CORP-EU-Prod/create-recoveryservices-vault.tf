resource "azurerm_recovery_services_vault" "weu-vault" {
  provider                     = azurerm.weu-management-sub
  name                         = "corp-rsv-weu-prod-shared-management-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_tags[local.weu-rsv-rgs[0]]

}
resource "azurerm_recovery_services_vault" "weu-dev-vault" {
  provider                     = azurerm.weu-management-sub
  name                         = "corp-rsv-weu-dev-shared-management-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_tags[local.weu-rsv-rgs[1]]
}

resource "azurerm_recovery_services_vault" "weu-identity-vault" {
  provider                     = azurerm.weu-identity-sub
  name                         = "corp-rsv-weu-prod-shared-identity-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-identity-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_identity_tags[local.weu-rsv-identity-rgs[0]]

}

resource "azurerm_recovery_services_vault" "weu-dev-identity-vault" {
  provider                     = azurerm.weu-identity-sub
  name                         = "corp-rsv-weu-dev-shared-identity-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-identity-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_identity_tags[local.weu-rsv-identity-rgs[1]]

}

resource "azurerm_recovery_services_vault" "weu-prod-tis-vault" {
  provider                     = azurerm.weu-prod-tis-sub
  name                         = "corp-rsv-weu-prod-tis-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-prod-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_prod_tags[local.weu-rsv-prod-rgs[0]]

}

resource "azurerm_recovery_services_vault" "weu-prod-tas-vault" {
  provider                     = azurerm.weu-prod-tas-sub
  name                         = "corp-rsv-weu-prod-tas-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-prod-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_prod_tags[local.weu-rsv-prod-rgs[1]]

}

resource "azurerm_recovery_services_vault" "weu-dev-tis-vault" {
  provider                     = azurerm.weu-dev-tis-sub
  name                         = "corp-rsv-weu-dev-tis-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-dev-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_dev_tags[local.weu-rsv-dev-rgs[0]]

}

resource "azurerm_recovery_services_vault" "weu-dev-tas-vault" {
  provider                     = azurerm.weu-dev-tas-sub
  name                         = "corp-rsv-weu-dev-tas-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-dev-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_dev_tags[local.weu-rsv-dev-rgs[1]]

}

resource "azurerm_recovery_services_vault" "weu-uat-tis-vault" {
  provider                     = azurerm.weu-uat-tis-sub
  name                         = "corp-rsv-weu-uat-tis-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-uat-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_uat_tags[local.weu-rsv-uat-rgs[0]]

}

resource "azurerm_recovery_services_vault" "weu-uat-tas-vault" {
  provider                     = azurerm.weu-uat-tas-sub
  name                         = "corp-rsv-weu-uat-tas-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-uat-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_uat_tags[local.weu-rsv-uat-rgs[1]]

}


//############################################ BACKUP  POLICIES #########################################

resource "azurerm_backup_policy_vm" "corp-weu-prod-daily-policy" {
  provider            = azurerm.weu-management-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "corp-weu-dev-daily-policy" {
  provider            = azurerm.weu-management-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-dev-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "corp-weu-prod-identity-daily-policy" {
  provider            = azurerm.weu-identity-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-identity-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-identity-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "corp-weu-dev-identity-daily-policy" {
  provider            = azurerm.weu-identity-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-identity-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-dev-identity-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

// prod Sub policy

resource "azurerm_backup_policy_vm" "corp-weu-prod-tis-daily-policy" {
  provider            = azurerm.weu-prod-tis-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-prod-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-prod-tis-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "corp-weu-prod-tas-daily-policy" {
  provider            = azurerm.weu-prod-tas-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-prod-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-prod-tas-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}


// Dev Backup policy

resource "azurerm_backup_policy_vm" "corp-weu-dev-tis-daily-policy" {
  provider            = azurerm.weu-dev-tis-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-dev-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-dev-tis-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "corp-weu-dev-tas-daily-policy" {
  provider            = azurerm.weu-dev-tas-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-dev-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-dev-tas-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}


// UAT Backup Policy 


resource "azurerm_backup_policy_vm" "corp-weu-uat-tis-daily-policy" {
  provider            = azurerm.weu-uat-tis-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-uat-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-uat-tis-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "corp-weu-uat-tas-daily-policy" {
  provider            = azurerm.weu-uat-tas-sub
  name                = "corp-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-uat-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-uat-tas-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}
