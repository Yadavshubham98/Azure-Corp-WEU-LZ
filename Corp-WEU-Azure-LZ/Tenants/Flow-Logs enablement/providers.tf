terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "corp-rg-weu-prod-shared-terraform" //replace with your own storage account resource group for the state file
    storage_account_name = "corpstorweupcoretf100"             //replace with your own storage account name
    container_name       = "tfstate-container"                 //replace with your own container name
    key                  = "CorpWestEuropeLZ-ServersFlowLogs.tfstate"          //replace with your own file name for the state file ending in .tfstate
  }
}

provider "azuread" {
  use_msi   = true
  tenant_id = var.tenant_id

}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  subscription_id = local.platform-weu-connectivity-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true // refer to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block for the settings on the features block
      recover_soft_deleted_key_vaults = true
    }

    log_analytics_workspace {
      permanently_delete_on_destroy = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = true // set to true for production
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = true
    }
  }
}

//East US Platform Providers
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-connectivity-sub"
  subscription_id = local.platform-weu-connectivity-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-identity-sub"
  subscription_id = local.platform-weu-identity-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-management-sub"
  subscription_id = local.platform-weu-management-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-security-sub"
  subscription_id = local.platform-weu-security-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-prod-tis-sub"
  subscription_id = local.weu-prod-tis-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-prod-tas-sub"
  subscription_id = local.weu-prod-tas-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-dev-tas-sub"
  subscription_id = local.weu-dev-tas-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-dev-tis-sub"
  subscription_id = local.weu-dev-tis-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-uat-tas-sub"
  subscription_id = local.weu-uat-tas-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-uat-tis-sub"
  subscription_id = local.weu-uat-tis-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "genpact-corporate-sub"
  subscription_id = local.genpact-corporate-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
