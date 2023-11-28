resource "azurerm_key_vault_key" "generated" {
  count = var.nb_instance
  name  = var.server_name
  key_vault_id = var.key_vault_id
  key_type     = var.key_type
  key_size     = var.key_size

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}