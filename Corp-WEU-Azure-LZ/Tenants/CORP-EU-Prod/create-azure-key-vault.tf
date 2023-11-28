data "azurerm_client_config" "current" {
}

data "azurerm_subnet" "corp-ind-terraform-subnet" {
  provider             = azurerm.genpact-corporate-sub
  name                 = "terraform-subnet"
  virtual_network_name = "Production-VNET"
  resource_group_name  = "GEN-CIND-CORPIT-PROD"
}

# output "subnet" {
#   value=data.azurerm_subnet.corp-ind-terraform-subnet.id
# }

resource "azurerm_key_vault" "corpakvweuutisencrypt10" {
  provider                    = azurerm.weu-uat-tis-sub
  name                        = "corpakvweuutisencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[0]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30
  purge_protection_enabled    = true

  enabled_for_deployment          = false
  sku_name                        = "standard"
  enabled_for_template_deployment = true
  tags                            = local.weu_akv_tags[local.weu-akv-rgs[0]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-uat-tis-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]

  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}



resource "azurerm_key_vault" "corpakvweuutasencrypt10" {
  provider                    = azurerm.weu-uat-tas-sub
  name                        = "corpakvweuudigencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[1]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = false
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[1]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-uat-tas-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}


resource "azurerm_key_vault" "corpakvweuptisencrypt10" {
  provider                    = azurerm.weu-prod-tis-sub
  name                        = "corpakvweuptisencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[2]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = false
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[2]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-prod-tis-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}



resource "azurerm_key_vault" "corpakvweuptasencrypt10" {
  provider                    = azurerm.weu-prod-tas-sub
  name                        = "corpakvweupdigencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[3]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = false
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[3]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-prod-tas-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }

}



resource "azurerm_key_vault" "corpakvweupsecencrypt10" {
  provider                    = azurerm.weu-security-sub
  name                        = "corpakvweupsecencrypt10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[4]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = false
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[4]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}


resource "azurerm_key_vault" "corpakvweupmgmtencrypt10" {
  provider                    = azurerm.weu-management-sub
  name                        = "corpakvweupmgmtencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[5]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = false
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[5]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-prod-management-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }

}



resource "azurerm_key_vault" "corpakvweudmgmtencrypt10" {
  provider                    = azurerm.weu-management-sub
  name                        = "corpakvweudmgmtencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[6]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = false
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[6]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-dev-management-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}


resource "azurerm_key_vault" "corpakvweudtisencrypt10" {
  provider                    = azurerm.weu-dev-tis-sub
  name                        = "corpakvweudtisencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[7]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = false
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[7]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-dev-tis-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}


resource "azurerm_key_vault" "corpakvweudtasencrypt10" {
  provider                    = azurerm.weu-dev-tas-sub
  name                        = "corpakvweuddigencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[8]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30
  purge_protection_enabled    = true

  enabled_for_deployment = false
  sku_name               = "standard"
  tags                   = local.weu_akv_tags[local.weu-akv-rgs[8]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-dev-tas-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}


resource "azurerm_key_vault" "corpakvweupidencrypt10" {
  provider                    = azurerm.weu-identity-sub
  name                        = "corpakvweupidencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[9]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = false
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[9]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-prod-identity-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }

}

resource "azurerm_key_vault" "corpakvweudidencrypt10" {
  provider                    = azurerm.weu-identity-sub
  name                        = "corpakvweudidencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[10]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30
  purge_protection_enabled    = true

  enabled_for_deployment = false
  sku_name               = "standard"
  tags                   = local.weu_akv_tags[local.weu-akv-rgs[10]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [azurerm_subnet.corp-weu-dev-identity-subnet[0].id, data.azurerm_subnet.corp-ind-terraform-subnet.id]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}

