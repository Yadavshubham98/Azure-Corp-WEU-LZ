# data "azurerm_resource_group" "main" {
#   name = "gch-rg-eus-prod-shared-connectivity-core-network"
# }

# data "azurerm_virtual_hub" "weu-vhub" {
#   provider            = azurerm.weu-connectivity-sub
#   name                = "gch-vhub-weu-shared"
#   resource_group_name = data.azurerm_resource_group.main.name
# }



# resource "azurerm_management_lock" "weu-vhub-lock" {
#   provider   = azurerm.weu-connectivity-sub
#   name       = "weu-vhub-lock"
#   scope      = data.azurerm_virtual_hub.weu-vhub.id
#   lock_level = "CanNotDelete"
#   notes      = "This resource cannot be deleted accidently."
# }