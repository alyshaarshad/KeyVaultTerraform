
resource "azurerm_key_vault" "keyvault" {
  name = var.keyvault_name

  location            = var.keyvault_location
  resource_group_name = var.resource_group_name

  tenant_id = var.keyvault_tenant_id

  sku_name = "standard"

  enabled_for_deployment          = "true"
  enabled_for_disk_encryption     = "true"
  enabled_for_template_deployment = "true"
  purge_protection_enabled        = "false"
}

resource "azurerm_key_vault_access_policy" "owner_access_policy" {
  object_id    = var.keyvault_owner_identifiers
  tenant_id    = var.keyvault_tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

  key_permissions = [
    "Backup",
    "Create",
    "Decrypt",
    "Delete",
    "Encrypt",
    "Get",
    "Import",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Sign",
    "UnwrapKey",
    "Update",
    "Verify",
    "WrapKey",
  ]

  secret_permissions = [
    "Backup",
    "Delete",
    "Get",
    "List",
    "Purge",
    "Recover",
    "Restore",
    "Set",
  ]

  certificate_permissions = [
    "Backup",
    "Create",
    "Delete",
    "DeleteIssuers",
    "Get",
    "GetIssuers",
    "Import",
    "List",
    "ListIssuers",
    "ManageContacts",
    "ManageIssuers",
    "Purge",
    "Recover",
    "Restore",
    "SetIssuers",
    "Update",
  ]
}

resource "azurerm_key_vault_secret" "applicationInsights_ConnectionString" {
  name         = "applicationinsightsConnectionString"
  value        = var.keyvault_applicationInsights_ConnectionString
  key_vault_id = azurerm_key_vault.keyvault.id
    depends_on = [
    azurerm_key_vault_access_policy.owner_access_policy
  ]
}

resource "azurerm_key_vault_secret" "applicationInsights_InstrumentationKey" {
  name         = "applicationinsightsInstrumentationKey"
  value        = var.keyvault_applicationInsights_InstrumentationKey
  key_vault_id = azurerm_key_vault.keyvault.id
    depends_on = [
    azurerm_key_vault_access_policy.owner_access_policy
  ]
}

