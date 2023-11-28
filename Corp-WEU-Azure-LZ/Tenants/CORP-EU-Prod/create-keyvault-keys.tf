
# //PROD weu

data "azurerm_key_vault" "corp-weu-uat-tis-vault" {
  provider            = azurerm.weu-uat-tis-sub
  name                = "corpakvweuutisencrpt-10"
  resource_group_name = "corp-rg-weu-uat-tis-akv"
  depends_on          = [azurerm_key_vault.corpakvweuutisencrypt10]
}

module "corp-weu-uat-tis-keys" {
  providers = {
    azurerm = azurerm.weu-uat-tis-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[0]
  # key_vault_id = data.azurerm_key_vault.get-weu-uat-tis-vault.id
  key_vault_id = azurerm_key_vault.corpakvweuutisencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweuutisencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-uat-tas-vault" {
  provider            = azurerm.weu-uat-tas-sub
  name                = "corpakvweuudigencrpt-10"
  resource_group_name = "corp-rg-weu-uat-tas-akv"
  depends_on = [azurerm_key_vault.corpakvweuutasencrypt10
  ]
}

module "corp-weu-uat-tas-keys" {
  providers = {
    azurerm = azurerm.weu-uat-tas-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[1]
  # key_vault_id = data.azurerm_key_vault.get-weu-uat-tas-vault.id
  key_vault_id = azurerm_key_vault.corpakvweuutasencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweuutasencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-prod-tis-vault" {
  provider            = azurerm.weu-prod-tis-sub
  name                = "corpakvweuptisencrpt-10"
  resource_group_name = "corp-rg-weu-prod-tis-akv"
  depends_on = [azurerm_key_vault.corpakvweuptisencrypt10
  ]
}

module "corp-weu-prod-tis-keys" {
  providers = {
    azurerm = azurerm.weu-prod-tis-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[2]
  # key_vault_id = data.azurerm_key_vault.get-weu-prod-tis-vault.id
  key_vault_id = azurerm_key_vault.corpakvweuptisencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweuptisencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-prod-tas-vault" {
  provider            = azurerm.weu-prod-tas-sub
  name                = "corpakvweupdigencrpt-10"
  resource_group_name = "corp-rg-weu-prod-tas-akv"
  depends_on = [azurerm_key_vault.corpakvweuptasencrypt10
  ]
}

module "corp-weu-prod-tas-keys" {
  providers = {
    azurerm = azurerm.weu-prod-tas-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[3]
  # key_vault_id = data.azurerm_key_vault.get-weu-prod-tas-vault.id
  key_vault_id = azurerm_key_vault.corpakvweuptasencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweuptasencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-prod-shared-management-vault" {
  provider            = azurerm.weu-management-sub
  name                = "corpakvweupmgmtencrpt-10"
  resource_group_name = "corp-rg-weu-prod-shared-management-akv"
  depends_on = [azurerm_key_vault.corpakvweupmgmtencrypt10
  ]
}

module "corp-weu-prod-shared-management-keys" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[5]
  # key_vault_id = data.azurerm_key_vault.get-weu-prod-shared-management-vault.id
  key_vault_id = azurerm_key_vault.corpakvweupmgmtencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweupmgmtencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-dev-shared-management-vault" {
  provider            = azurerm.weu-management-sub
  name                = "corpakvweudmgmtencrpt-10"
  resource_group_name = "corp-rg-weu-dev-shared-management-akv"
  depends_on = [azurerm_key_vault.corpakvweudmgmtencrypt10
  ]
}

module "corp-weu-dev-shared-management-keys" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[6]
  # key_vault_id = data.azurerm_key_vault.get-weu-dev-shared-management-vault.id
  key_vault_id = azurerm_key_vault.corpakvweudmgmtencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweudmgmtencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-dev-tis-vault" {
  provider            = azurerm.weu-dev-tis-sub
  name                = "corpakvweudtisencrpt-10"
  resource_group_name = "corp-rg-weu-dev-tis-akv"
  depends_on = [azurerm_key_vault.corpakvweudtisencrypt10
  ]
}

module "corp-weu-dev-tis-keys" {
  providers = {
    azurerm = azurerm.weu-dev-tis-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[7]
  # key_vault_id = data.azurerm_key_vault.get-weu-dev-tis-vault.id
  key_vault_id = azurerm_key_vault.corpakvweudtisencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweudtisencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-dev-tas-vault" {
  provider            = azurerm.weu-dev-tas-sub
  name                = "corpakvweuddigencrpt-10"
  resource_group_name = "corp-rg-weu-dev-tas-akv"
  depends_on = [azurerm_key_vault.corpakvweudtasencrypt10
  ]
}

module "corp-weu-dev-tas-keys" {
  providers = {
    azurerm = azurerm.weu-dev-tas-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[8]
  # key_vault_id = data.azurerm_key_vault.get-weu-dev-tas-vault.id
  key_vault_id = azurerm_key_vault.corpakvweudtasencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweudtasencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-prod-shared-identity-vault" {
  provider            = azurerm.weu-identity-sub
  name                = "corpakvweupidencrpt-10"
  resource_group_name = "corp-rg-weu-prod-shared-identity-akv"
  depends_on = [azurerm_key_vault.corpakvweupidencrypt10
  ]
}

module "corp-weu-prod-shared-identity-keys" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[9]
  # key_vault_id = data.azurerm_key_vault.get-weu-prod-shared-identity-vault.id
  key_vault_id = azurerm_key_vault.corpakvweupidencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweupidencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-dev-shared-identity-vault" {
  provider            = azurerm.weu-identity-sub
  name                = "corpakvweudidencrpt-10"
  resource_group_name = "corp-rg-weu-dev-shared-identity-akv"
  depends_on = [azurerm_key_vault.corpakvweudidencrypt10
  ]
}

module "corp-weu-dev-shared-identity-keys" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[10]
  # key_vault_id = data.azurerm_key_vault.get-weu-dev-shared-identity-vault.id
  key_vault_id = azurerm_key_vault.corpakvweudidencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.corpakvweudidencrypt10
  ]
}

