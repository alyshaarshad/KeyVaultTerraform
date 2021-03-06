resource "azurerm_application_insights" "application_insights" {
  name                = var.application_insights_name
  location            = var.application_insights_location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
}