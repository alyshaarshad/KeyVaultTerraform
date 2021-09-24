output "key_vault_id" {
  description = "Key Vault identifier"
  value       = azurerm_key_vault.keyvault.id
}

output "key_vault_name" {
  description = "Key vault name"
  value       = azurerm_key_vault.keyvault.name
}

output "key_vault_uri" {
  description = "the generated URI of key vault"
  value       = azurerm_key_vault.keyvault.vault_uri
}