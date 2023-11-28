
resource "azurerm_log_analytics_workspace" "corp-la-weu-workspace" {
  provider            = azurerm.weu-security-sub
  name                = "corp-la-weu-workspace"
  location            = var.location-weu
  resource_group_name = local.security-subscription-rg[0]
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.security_subscription_tags[local.security-subscription-rg[0]]
}