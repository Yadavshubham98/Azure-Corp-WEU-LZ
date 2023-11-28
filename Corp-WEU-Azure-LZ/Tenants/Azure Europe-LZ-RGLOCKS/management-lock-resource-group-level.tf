data "azurerm_resource_group" "corp-rg-weu-shared-connectivity-core-network" {
  name = "corp-rg-weu-prod-shared-connectivity-core-network"
}


resource "azurerm_management_lock" "resource-group-level-lock23" {
  provider   = azurerm.weu-connectivity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-shared-connectivity-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-dev-shared-management-core-network" {
  provider = azurerm.weu-management-sub
  name     = "corp-rg-weu-dev-shared-management-core-network"
}

resource "azurerm_management_lock" "resource-group-level-lock24" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-management-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-management-core-network" {
  name     = "corp-rg-weu-prod-shared-management-core-network"
  provider = azurerm.weu-management-sub
}

resource "azurerm_management_lock" "resource-group-level-lock25" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-management-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-shared-identity-core-network" {
  name     = "corp-rg-weu-dev-shared-identity-core-network"
  provider = azurerm.weu-identity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock26" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-identity-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-identity-core-network" {
  name     = "corp-rg-weu-prod-shared-identity-core-network"
  provider = azurerm.weu-identity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock27" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-identity-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-tis-core-network" {
  name     = "corp-rg-weu-prod-tis-core-network"
  provider = azurerm.weu-prod-tis-sub
}

resource "azurerm_management_lock" "resource-group-level-lock28" {
  provider   = azurerm.weu-prod-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-tis-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-tas-core-network" {
  name     = "corp-rg-weu-prod-tas-core-network"
  provider = azurerm.weu-prod-tas-sub
}

resource "azurerm_management_lock" "resource-group-level-lock29" {
  provider   = azurerm.weu-prod-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-tas-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-tis-core-network" {
  name     = "corp-rg-weu-dev-tis-core-network"
  provider = azurerm.weu-dev-tis-sub
}

resource "azurerm_management_lock" "resource-group-level-lock30" {
  provider   = azurerm.weu-dev-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-tis-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-dev-tas-core-network" {
  name     = "corp-rg-weu-dev-tas-core-network"
  provider = azurerm.weu-dev-tas-sub
}

resource "azurerm_management_lock" "resource-group-level-lock31" {
  provider   = azurerm.weu-dev-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-tas-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-uat-tis-core-network" {
  name     = "corp-rg-weu-uat-tis-core-network"
  provider = azurerm.weu-uat-tis-sub
}

resource "azurerm_management_lock" "resource-group-level-lock32" {
  provider   = azurerm.weu-uat-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-uat-tis-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-uat-tas-core-network" {
  name     = "corp-rg-weu-uat-tas-core-network"
  provider = azurerm.weu-uat-tas-sub
}

resource "azurerm_management_lock" "resource-group-level-lock33" {
  provider   = azurerm.weu-uat-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-uat-tas-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-shared-connectivity-zcc-network" {
  name     = "corp-rg-weu-prod-shared-connectivity-zcc-network"
  provider = azurerm.weu-connectivity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock34" {
  provider   = azurerm.weu-connectivity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-connectivity-zcc-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-shared-connectivity-zcc-01" {
  name     = "corp-rg-weu-prod-shared-connectivity-zcc-01"
  provider = azurerm.weu-connectivity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock35" {
  provider   = azurerm.weu-connectivity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-connectivity-zcc-01.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-identity-core-adc" {
  name     = "corp-rg-weu-prod-shared-identity-core-adc"
  provider = azurerm.weu-identity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock36" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-identity-core-adc.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-dev-shared-identity-core-adc" {
  name     = "corp-rg-weu-dev-shared-identity-core-adc"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock37" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-identity-core-adc.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-shared-identity-core-okta" {
  name     = "corp-rg-weu-prod-shared-identity-core-okta"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock38" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-identity-core-okta.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-dev-shared-identity-core-okta" {
  name     = "corp-rg-weu-dev-shared-identity-core-okta"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock39" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-identity-core-okta.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-shared-management-core-lmc" {
  name     = "corp-rg-weu-prod-shared-management-core-lmc"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock40" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-management-core-lmc.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-dev-shared-management-core-lmc" {
  name     = "corp-rg-weu-dev-shared-management-core-lmc"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock41" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-management-core-lmc.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-management-core-jmp" {
  name     = "corp-rg-weu-prod-shared-management-core-jmp"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock42" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-management-core-jmp.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-dev-shared-management-core-jmp" {
  name     = "corp-rg-weu-dev-shared-management-core-jmp"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock43" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-management-core-jmp.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-management-core-zpa" {
  name     = "corp-rg-weu-prod-shared-management-core-zpa"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock44" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-management-core-zpa.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-shared-management-core-zpa" {
  name     = "corp-rg-weu-dev-shared-management-core-zpa"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock45" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-management-core-zpa.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-uat-tis-akv" {
  name     = "corp-rg-weu-uat-tis-akv"
  provider = azurerm.weu-uat-tis-sub
}
resource "azurerm_management_lock" "resource-group-level-lock46" {
  provider   = azurerm.weu-uat-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-uat-tis-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-uat-tas-akv" {
  name     = "corp-rg-weu-uat-tas-akv"
  provider = azurerm.weu-uat-tas-sub
}
resource "azurerm_management_lock" "resource-group-level-lock47" {
  provider   = azurerm.weu-uat-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-uat-tas-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-tis-akv" {
  name     = "corp-rg-weu-prod-tis-akv"
  provider = azurerm.weu-prod-tis-sub
}
resource "azurerm_management_lock" "resource-group-level-lock48" {
  provider   = azurerm.weu-prod-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-tis-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-tas-akv" {
  name     = "corp-rg-weu-prod-tas-akv"
  provider = azurerm.weu-prod-tas-sub
}
resource "azurerm_management_lock" "resource-group-level-lock49" {
  provider   = azurerm.weu-prod-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-tas-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-security-akv" {
  name     = "corp-rg-weu-prod-shared-security-akv"
  provider = azurerm.weu-security-sub

}
resource "azurerm_management_lock" "resource-group-level-lock50" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-security-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-management-akv" {
  name     = "corp-rg-weu-prod-shared-management-akv"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock51" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-management-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-shared-management-akv" {
  name     = "corp-rg-weu-dev-shared-management-akv"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock52" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-management-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-tis-akv" {
  name     = "corp-rg-weu-dev-tis-akv"
  provider = azurerm.weu-dev-tis-sub
}
resource "azurerm_management_lock" "resource-group-level-lock56" {
  provider   = azurerm.weu-dev-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-tis-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-tas-akv" {
  name     = "corp-rg-weu-dev-tas-akv"
  provider = azurerm.weu-dev-tas-sub
}
resource "azurerm_management_lock" "resource-group-level-lock53" {
  provider   = azurerm.weu-dev-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-tas-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-identity-akv" {
  name     = "corp-rg-weu-prod-shared-identity-akv"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock54" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-identity-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-shared-identity-akv" {
  name     = "corp-rg-weu-dev-shared-identity-akv"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock55" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-identity-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-management-core-rsv" {
  name     = "corp-rg-weu-prod-shared-management-core-rsv"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock57" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-management-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-dev-shared-management-core-rsv" {
  name     = "corp-rg-weu-dev-shared-management-core-rsv"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock58" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-management-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-shared-identity-core-rsv" {
  name     = "corp-rg-weu-prod-shared-identity-core-rsv"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock59" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-identity-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-dev-shared-identity-core-rsv" {
  name     = "corp-rg-weu-dev-shared-identity-core-rsv"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock60" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-identity-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-tis-core-rsv" {
  name     = "corp-rg-weu-prod-tis-core-rsv"
  provider = azurerm.weu-prod-tis-sub
}
resource "azurerm_management_lock" "resource-group-level-lock61" {
  provider   = azurerm.weu-prod-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-tis-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-tas-core-rsv" {
  name     = "corp-rg-weu-prod-tas-core-rsv"
  provider = azurerm.weu-prod-tas-sub
}
resource "azurerm_management_lock" "resource-group-level-lock62" {
  provider   = azurerm.weu-prod-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-tis-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-tis-core-rsv" {
  name     = "corp-rg-weu-dev-tis-core-rsv"
  provider = azurerm.weu-dev-tis-sub
}
resource "azurerm_management_lock" "resource-group-level-lock63" {
  provider   = azurerm.weu-dev-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-tis-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-dev-tas-core-rsv" {
  name     = "corp-rg-weu-dev-tas-core-rsv"
  provider = azurerm.weu-dev-tas-sub
}
resource "azurerm_management_lock" "resource-group-level-lock64" {
  provider   = azurerm.weu-dev-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-tas-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-uat-tis-core-rsv" {
  name     = "corp-rg-weu-uat-tis-core-rsv"
  provider = azurerm.weu-uat-tis-sub
}
resource "azurerm_management_lock" "resource-group-level-lock65" {
  provider   = azurerm.weu-uat-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-uat-tis-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-uat-tas-core-rsv" {
  name     = "corp-rg-weu-uat-tas-core-rsv"
  provider = azurerm.weu-uat-tas-sub
}
resource "azurerm_management_lock" "resource-group-level-lock66" {
  provider   = azurerm.weu-uat-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-uat-tis-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

// storage RGs locks--------------------------------------

data "azurerm_resource_group" "corp-rg-weu-uat-tis-bootdiag" {
  name     = "corp-rg-weu-uat-tis-bootdiag"
  provider = azurerm.weu-uat-tis-sub
}
resource "azurerm_management_lock" "resource-group-level-lock67" {
  provider   = azurerm.weu-uat-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-uat-tis-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-uat-tas-bootdiag" {
  name     = "corp-rg-weu-uat-tas-bootdiag"
  provider = azurerm.weu-uat-tas-sub
}
resource "azurerm_management_lock" "resource-group-level-lock68" {
  provider   = azurerm.weu-uat-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-uat-tas-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-tis-bootdiag" {
  name     = "corp-rg-weu-prod-tis-bootdiag"
  provider = azurerm.weu-prod-tis-sub
}
resource "azurerm_management_lock" "resource-group-level-lock69" {
  provider   = azurerm.weu-prod-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-tis-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "corp-rg-weu-prod-tas-bootdiag" {
  name     = "corp-rg-weu-prod-tas-bootdiag"
  provider = azurerm.weu-prod-tas-sub
}
resource "azurerm_management_lock" "resource-group-level-lock70" {
  provider   = azurerm.weu-prod-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-tas-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-security-bootdiag" {
  name     = "corp-rg-weu-prod-shared-security-bootdiag"
  provider = azurerm.weu-security-sub

}
resource "azurerm_management_lock" "resource-group-level-lock71" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-security-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-management-bootdiag" {
  name     = "corp-rg-weu-prod-shared-management-bootdiag"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock72" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-management-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-shared-management-bootdiag" {
  name     = "corp-rg-weu-dev-shared-management-bootdiag"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock73" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-management-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-tis-bootdiag" {
  name     = "corp-rg-weu-dev-tis-bootdiag"
  provider = azurerm.weu-dev-tis-sub
}
resource "azurerm_management_lock" "resource-group-level-lock74" {
  provider   = azurerm.weu-dev-tis-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-tis-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-tas-bootdiag" {
  name     = "corp-rg-weu-dev-tas-bootdiag"
  provider = azurerm.weu-dev-tas-sub
}
resource "azurerm_management_lock" "resource-group-level-lock75" {
  provider   = azurerm.weu-dev-tas-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-tas-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-identity-bootdiag" {
  name     = "corp-rg-weu-prod-shared-identity-bootdiag"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock76" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-identity-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-shared-identity-bootdiag" {
  name     = "corp-rg-weu-dev-shared-identity-bootdiag"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock77" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-identity-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-security-analytics-log" {
  name     = "corp-rg-weu-prod-shared-security-analytics-log"
  provider = azurerm.weu-security-sub
}
resource "azurerm_management_lock" "resource-group-level-lock78" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-security-analytics-log.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}



# data "azurerm_resource_group" "corp-rg-weu-dev-shared-security-analytics-log" {
#   name     = "corp-rg-weu-dev-shared-security-analytics-log"
#   provider = azurerm.weu-security-sub
# }
# resource "azurerm_management_lock" "resource-group-level-lock79" {
#   provider   = azurerm.weu-security-sub
#   name       = "resource-group-level-lock"
#   scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-security-analytics-log.id
#   lock_level = "CanNotDelete"
#   notes      = "This resource cannot be deleted"
# }


data "azurerm_resource_group" "corp-rg-weu-prod-shared-flowlog-storage" {
  name     = "corp-rg-weu-prod-shared-flowlog-storage"
  provider = azurerm.weu-security-sub
}
resource "azurerm_management_lock" "resource-group-level-lock80" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-flowlog-storage.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-shared-flowlog-storage" {
  name     = "corp-rg-weu-dev-shared-flowlog-storage"
  provider = azurerm.weu-security-sub
}
resource "azurerm_management_lock" "resource-group-level-lock81" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-flowlog-storage.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-prod-shared-private-dns-zone" {
  name     = "corp-rg-weu-prod-shared-private-dns-zone"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock82" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-prod-shared-private-dns-zone.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "corp-rg-weu-dev-shared-private-dns-zone" {
  name     = "corp-rg-weu-dev-shared-private-dns-zone"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock83" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.corp-rg-weu-dev-shared-private-dns-zone.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}
