terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "=2.53.0"
        }
  }

}

provider "azurerm" {
    features {
    }
  
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "resource_Group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "application_insights" {
  source                        = "./appinsights"
  application_insights_name     = var.application_insights_name
  application_insights_location = azurerm_resource_group.resource_Group.location
  resource_group_name           = azurerm_resource_group.resource_Group.name
  application_type              = "web"

  depends_on = [
    azurerm_resource_group.resource_Group
  ]
}


module "keyvault" {
  source                                            = "./keyvault"
  keyvault_name                                     = var.keyvault_name
  resource_group_name                               = azurerm_resource_group.resource_Group.name
  keyvault_location                                 = azurerm_resource_group.resource_Group.location
  keyvault_tenant_id                                = data.azurerm_client_config.current.tenant_id
  keyvault_owner_identifiers                        = var.keyvault_owner_identifiers
  keyvault_applicationInsights_ConnectionString     = module.application_insights.application_insights_connection_string
  keyvault_applicationInsights_InstrumentationKey   = module.application_insights.application_insights_instrumentation_key
  
  depends_on = [
    azurerm_resource_group.resource_Group
  ]
}

